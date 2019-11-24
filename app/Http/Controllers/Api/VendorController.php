<?php

namespace App\Http\Controllers\Api;

use App\Api\Helpers\RsaHandle;
use App\Http\Requests\Api\VendorRequest;
use App\Jobs\Api\sendCommission;
use App\Models\BbcVendorJoinin;
use Carbon\Carbon;
use http\Url;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Route;
use OpenApi\Annotations\Get;
use OpenApi\Annotations\Parameter;
use OpenApi\Annotations\Post;
use OpenApi\Annotations\Response;
use OpenApi\Annotations\Schema;
use phpDocumentor\Reflection\Project;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Http\Parser\InputSource;

class VendorController extends Controller
{

    public function queue($url,$arr){
        dispatch(new sendCommission($url,$arr));
    }
    /**
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     * 商家保证金+功能费+会员费
     * @Post(path="/api/v1/vendor/store",tags={"商家保证金"},summary="商家入驻后需要的费用",
     *      @Parameter(name="member_id",description="会员id",required=true,in="query",@Schema(type="string")),
     *      @Parameter(name="sg_id",description="店铺等级",required=true,in="query",@Schema(type="string")),
     *      @Parameter(name="joinin_year",description="加入年限",required=true,in="query",@Schema(type="string")),
     *      @Parameter(name="func_cost",description="功能费用",required=true,in="query",@Schema(type="string")),
     *      @Parameter(name="deposit",description="保证金",required=true,in="query",@Schema(type="string")),
     *      @Response(response="200",description="请求成功"),
     *     @Response(response="400",description="请求失败")
     * )
     */
    public function store(VendorRequest $vendorRequest)
    {

        //获取商家的member_id
        $member_id = $vendorRequest->member_id;
        $vendor_info = BbcVendorJoinin::where('member_id', '=', $member_id);
        $sg_id = $vendor_info['sg_id'];//店铺等级
        $joinin_year = $vendor_info['joinin_year'];//开店年限
        //徐新增字段功能费:func_cost
        $func_cost = $vendor_info['func_cost'];//新增功能费
        $deposit = $vendor_info['deposit'];//保证金
        $result = DB::table("bbc_vendor_joinin")
            ->where("bbc_vendor_joinin.member_id", '=', $member_id)
            ->where("bbc_vendor_joinin.sg_id", '=', string($sg_id))
            ->leftJoin('bbc_store_grade', 'bbc_vendor_joinin.sg_id', '=', 'bbc_store_grade.sg_id')
            ->select('bbc_vendor_joinin.sg_info', 'bbc_store_grade.sg_name', 'bbc_store_grade.sg_price')
            ->get()->toArray();
        $sg_price = (intval($result[0]->sg_price));
        $paying_amount = $func_cost + $deposit + $sg_id * $joinin_year * $sg_price;// 付款总金额   功能费+会员费+保证金
        $amount = isset($vendor_info['paying_amount']) ?$vendor_info['paying_amount']: 0;//判断付款总金额的数据库存的值是否与计算的相等
        if ($amount == $paying_amount) {
            //同步k3财务
            $result = $this->PostRequestData(getenv('K3_URL'), [
                'vendor_info' => $vendor_info,
            ]);
            BbcVendorJoinin::update(['process' => '2']);
            return $this->setStatusCode(200)->success($result);
        }
        BbcVendorJoinin::update(['process' => '3']);
        return $this->failed('同步失败', 404);
    }
    /**
     * @param VendorRequest $vendorRequest
     * @Post(path="/api/v1/vendorValidate ",tags={"企业工商信息认证(传其一即可)"},summary="企业工商信息认证",
     *     @Parameter(name="business_licence_number",description="营业执照号",required=false,in="query",@Schema(type="string")),
     *     @Parameter(name="organization_code",description="组织机构代码",required=false,in="query",@Schema(type="string")),
     *     @Response(response="200",description="请求成功"),
     *     @Response(response="400",description="请求失败")
     * )
     */
    public function VendorValidate(VendorRequest $vendorRequest){
        $business_licence_number=$vendorRequest->business_licence_number;//营业执照号
//        $company_name=$vendorRequest->company_name;//公司名称
        $organization_code=$vendorRequest->organization_code;//组织机构代码
        $commi=[
            'business_licence_number'=>$business_licence_number?$business_licence_number:0,
            'organization_code'=>$organization_code?$organization_code:0,
//            'company_name'=>$company_name?$company_name:0,
        ];
        $keyword=$commi[array_rand($commi,1)];
        if ($keyword && $keyword !==0){
            $juheResult=$this->PostRequestData(getenv('JuheApi'),[
                'key'=>getenv('juheVendorAppKey'),
                'keyword'=>$keyword,
            ]);
            $total=$juheResult['result']['data']['total'];
            if((0 == intval($juheResult['error_code']))  && ($total>=0)  ){
                return $this->setStatusCode(200)->success('success');

            }
            return $this->failed('认证失败',$juheResult['error_code']);
        }
        return $this->failed('认证失败',$GLOBALS['juheResult']['error_code']);

    }
    public function test()
    {
        $data = 'data,我是testdata';
        echo 'base64:' . base64_encode($data) . '<br>';
        echo $data . '<br>';
        echo 'encrypted by public key<br>';
        $encrypted = RsaHandle::enPrivate($data);
        echo $encrypted . '<br>';
        $decrypted = RsaHandle::dePublic($encrypted);
        echo $decrypted . '<br>';
    }

    /**
     * @return mixed
     * @throws TokenExpiredException
     *
     *
     * @Get(path="/api/v1/requestChain",tags={"区块链浏览器"},
     *     summary="请求区块链的原始数据,跳转到enLogindata处理业务,产生加密token",
     *     @Parameter(name="",description="null",allowEmptyValue=true,in="query",@Schema(type="String")),
     *     @Response(response="200",description="请求成功"),
     *     @Response(response="400",description="请求失败")
     * )
     */
    public function requestChain()
    {
//        $key=str_pad(random_int(1, 9999), 6, 0, STR_PAD_LEFT)."@verify@".str_random(15).md5(uniqid());
        $key = "@verify@";
        $name = 'horizou';
        $expiredAt = strtotime(now()->addMinutes(1));
//        $time=date('Y-m-d H:i:s',$expiredAt);
        Cache::put($key, ['name' => $name], $expiredAt);
        $result = [
            'key' => $key,
            'name' => $name,
            'expired_time' => $expiredAt,
        ];
        return $this->enLogindata($result);
    }

    public function enLogindata($request)
    {
        $requestDate = Cache::get($request['key']);
        if (!$requestDate) {
            return $this->failed('faild', 403);
        }
        $equl = $request['expired_time'] - (strtotime(Carbon::now()));
        if ($equl < 0) {
            Cache::forget($request['key']);
            throw new TokenExpiredException('failed');
        }
        $encrypted = RsaHandle::enPrivate(json_encode($request));
        echo "加密字符:<br>" . $encrypted . "<br>";
        //todo 请求区块链浏览器地址
        $deresult = RsaHandle::dePublic($encrypted);
        echo "解密字符串:<br>" . $deresult;
//        return  "token?".$encrypted;
    }

    /**
     * @param $order_sn
     */
    public function payAfter(Request $request)
    {
        //取下单的订单信息,
        $order_info = Db::table('bbc_order')
            ->where('order_sn', '=', $request->order_sn)
            ->where('refund_state', '=', '0')->get();
        foreach ($order_info as $info => $v) {
            $goods_list = Db::table('goods')->where('order_id', '=', $v['gid'])->select('goods_commonid', 'goods_serial');

            if ($v['has_spec']) {
                $v['spec_num_arr'] = unserialize($v['spec_num']);
                $spec_array = Db::table('goods')->where('goods_commonid', '=', $goods_list['goods_commonid'])
                    ->select('goods_spec', 'gid', 'vid', 'goods_image', 'color_id', 'goods_storage');
                $spec_list = [];
                foreach ($spec_array as $s_key => $s_value) {
                    $s_array = unserialize($s_value['goods_spec']);
                    $tmp_array = array();
                    if (!empty($s_array) && is_array($s_array)) {
                        foreach ($s_array as $k => $v) {
                            $tmp_array[] = $k;
                        }
                    }
                    //对特殊商品价格排序
                    sort($tmp_array);
                    $spec_sign = implode('|', $tmp_array);
                    $spec_list[$spec_sign]['storage'] = $s_value['goods_storage'];
                    $spec_list[$spec_sign]['field_name'] = implode('/', $s_array);
                }
                $v['spec_data'] = $spec_list;
            }
            $v['goods_serial'] = $order_info['goods_serial'];
            $v['goods_image_url'] = $v['goods_image'];
            $order_info['extend_order_goods'][] = $v;
        }
        //判断是否是推手订单计算佣金=====start
        if (isset($request->markgid) && intval($request->markgid) > 0) {
            $yj_data=array();
            $order_data=array();
            if (!empty($order_info)) {
                $istsgou = 1;
                foreach ($order_info['extend_order_goods'] as $k => $v) {

                    $res = Db::table('ssys_goods')->where('gid', '=', $v['gid'])
                        ->where('\'is_buy_condition\'=>1')->get;
                    if (!$res) {
                        $istsgou = 0;
                        break;
                    }
                }
                $member_info = Db::table('ssys_member')->where('shop_member_id', '=', $order_info['buyer_id'])
                    ->where('ts_member_state', '=', 2)->get();
                if ($istsgou && $member_info) {
                    $re = Db::table('ssys_ts_order')->insert([
                        'ssysorder_member_id' => $member_info['member_id'],
                        'ssysorder_shop_member_id' => $member_info['shop_member_id'],
                        'ssysorder_order_id' => $order_info['order_id'],
                    ]);
                    if ($re) {
                        $spreader_flag = isset($request->spreader_flag) ? $request->spreader_flag : 0;
                        $order_info = isset($order_info) ? $order_info : 0;
                        $spreader_goods = array();
                        if ($spreader_flag) {
                            // 组装 标示数据
                            $spreader_goods_l = explode(',', $spreader_flag);
                            foreach ($spreader_goods_l as $key => $value) {
                                $spreader_goods_item_l = explode('|', $value);
                                if (is_array($spreader_goods_item_l) && !empty($spreader_goods_item_l)) {
                                    $spreader_goods[$spreader_goods_item_l[0]] = $spreader_goods_item_l[1];
                                }
                                unset($spreader_goods_item_l);
                            }
                            unset($spreader_goods_l);
                        }
                        //遍历特殊商品的携带的扩展信息
                        foreach ($order_info['extend_order_goods'] as $key => $value) {
                            $goods_num = $value['goods_num'];
                            $spreader_member_id = 0; //分享的标识码
                            //如果存在分享标识
                            if ($spreader_goods[$value['gid']]) {
                                //todo 解码标识,读取标识,等等操作
                                $spreader_member_id = 'test_code';
                            } else {
                                //检查是否有绑定推手
                                $check_nexus_info = Db::table('ssys_member')->where('shop_member_id', '=', $order_info['buyer_id'])
                                    ->select('member_id');
                                if (is_array($check_nexus_info) && !empty($check_nexus_info) && $check_nexus_info['member_id']) {
                                    $spreader_member_id = $check_nexus_info['member_id'];
                                }
                            }
                            //如果存在标识码.表示有推手
                            if ($spreader_member_id > 0) {
//                                            //计算推手佣金
                                $more_level_spreader_member = $this->get_mutil_level_spreader($spreader_member_id);
                                if (is_array($more_level_spreader_member) && !empty($more_level_spreader_member)) {
                                    foreach ($more_level_spreader_member as $m_l_s_m_k => $m_l_s_m_v) {
                                        $order_goods_item_data = $order_info;
                                        $order_goods_item_data['member_id'] = $m_l_s_m_v['member_id'];
                                        $order_goods_item_data['gid'] = $value['gid'];
                                        //获取推手的佣金
                                        $yj_amount=$this->getGoodsCommission($order_goods_item_data['gid'],$order_goods_item_data['member_id'],$more_level_spreader_member['deep']);
                                        $order_goods_item_data['yj_status'] = '0';
                                        $order_goods_item_data['yj_amount'] = $yj_amount * $goods_num;
                                        $yj_data_item['member_id'] = $m_l_s_m_v['member_id'];
                                        $spreader_member_info=Db::table('bbc_ssys_member')->where('member_id','=',$m_l_s_m_v['member_id'])->get();
                                        $yj_data_item['member_name'] = $spreader_member_info['member_name'];
                                        $yj_data_item['amount'] = $order_goods_item_data['yj_amount'];
                                        $yj_data_item['order_sn'] = $order_goods_item_data['order_sn'];
                                        $yj_data_item['gid'] = $order_goods_item_data['gid'];
                                        $yj_data[] = $yj_data_item;
                                        $order_data[] = $order_goods_item_data;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            //判断是否是推手订单=====end

            //同步佣金和佣金订单到k3或者其他系统
            if (!empty($yj_data) && !empty($order_data)) {
            //        加入到结算队列
                    $result=$this->queue(getenv('K3_URL'),$order_data);
//                    $result=$this->PostRequestData(getenv('K3_URL'),$order_data);
                    if($result){
                        //某个同步失败的标记
                        if($result['code']==23){
                            Db::table('bbc_ssys_order')->update(['process'=>3,]);
                        }
                        //同步成功
                        Db::table('bbc_ssys_order')->update(['process'=>2,]);
                    }
                    $order_data['process']=3;
                    $yj_data['process']=3;
                    $yjresult=$this->queue(getenv('K3_URL'),$yj_data);
//                    $yjresult=$this->PostRequestData(getenv('K3_URL'),$yj_data);
                if($yjresult){
                    //某个同步失败的标记
                    if($yjresult['code']==23){
                        Db::table('bbc_ssys_yj_log')->update(['process'=>3,]);
                    }
                    //同步成功
                    Db::table('bbc_ssys_yj_log')->update(['process'=>2,]);
                }
                    Db::table('bbc_ssys_order')->insert($order_data);
                    Db::table('bbc_ssys_yj_log')->update($yj_data);
            }
        }
        //无推手订单.
        else {
            //todo 直接进入结算队列
           $this->queue(getenv('K3_URL'),$order_info);
        }

    }


    //获取推手的上级.
    public function get_mutil_level_spreader($spreader_member_id)
    {
        $return_array = array();
        $member_info = Db::table('ssys_member')
            ->where('member_id', '=', $spreader_member_id)
            ->get();
        $shop_member_id = $member_info['shop_member_id'];
        if ($shop_member_id) {
            $first_deep['member_id'] = $spreader_member_id;
            $first_deep['deep'] = 1;
            $return_array[] = $first_deep;
            // 查询 是否有上级推手
            $nexus_condition['shop_member_id'] = $shop_member_id;
            $parent_spreader_info = Db::table('ssys_member_nexus')
                ->where('shop_member_id', '=', $shop_member_id)->get();
            $parent_spreader_member_id = $parent_spreader_info['member_id'];
            if ($parent_spreader_member_id) {
                $second_deep['member_id'] = $parent_spreader_member_id;
                $second_deep['deep'] = 2;

                $return_array[] = $second_deep;

                // 查询 是否有上级推手
                $parent_spreader_member_info = Db::table('ssys_member_nexus')
                    ->where('shop_member_id', '=', $parent_spreader_member_id)->get();

                $parent_spreader_shop_member_id = $parent_spreader_member_info['shop_member_id'];
                $nexus_condition['shop_member_id'] = $parent_spreader_shop_member_id;
                $parent_parent_spreader_info = $member_info = Db::table('ssys_member')
                    ->where('member_id', '=', $nexus_condition['shop_member_id'])
                    ->get();
                $parent_parent_spreader_member_id = $parent_parent_spreader_info['member_id'];

                if ($parent_parent_spreader_member_id) {
                    $last_deep['member_id'] = $parent_parent_spreader_member_id;
                    $last_deep['deep'] = 3;
                    $return_array[] = $last_deep;
                }
            }
        }
        return $return_array;


    }

    //        推手的 分享标示 加密
    public function encode_spreader_code($id)
    {
        $encode_code = base64_encode(intval($id) * 20181111);
        return $encode_code;
    }

    // 推手的 分享标示 解密
    public function decode_spreader_code($code)
    {
        $decode_code = intval(base64_decode($code) / 20181111);
        return $decode_code;
    }
    /**
     * @Get(path="/api/v1/sendYj",tags={"修改佣金比例"},summary="修改佣金比例",
     *     @Parameter(name="level",description="分佣级别",required=true,example="3",in="query",@Schema(type="string")),
     *     @Parameter(name="b",description="一级分佣比例",required=true,example="10",in="query",@Schema(type="string")),
     *     @Parameter(name="c",description="二级分佣比例",required=false,example="80",in="query",@Schema(type="string")),
     *     @Parameter(name="d",description="三级分佣比例",required=false,example="10",in="query",@Schema(type="string")),
     *     @Response(response="200",description="请求成功"),
     *     @Response(response="400",description="请求失败")
     *     )
     */
    //修改佣金比例
    public function sendYj($level, $b, $c, $d)
    {
        $level = isset($level) ?$level:3;
        $b = isset($b) ?$b:10;
        $c = isset($c) ?$c:80;
        $d = isset($d) ?$d:10;
        Db::table('bbc_ssys_setting')->where("name", "=", "ssys_yj_percent")->update([
            'value' => serialize([
                'a' => $level,
                'b' => $b,
                'c' => $c,
                'd' => $d
            ]),
        ]);
        $result = Db::table('bbc_ssys_setting')->where('name', '=', 'ssys_yj_percent')->get();
        $data = $this->mb_unserialize($result);
        return unserialize(json_decode($data, 1)[0]['value']);
    }

    public function mb_unserialize($str)
    {
        return preg_replace_callback('#s:(\d+):"(.*?)";#s', function ($match) {
            return 's:' . strlen($match[2]) . ':"' . $match[2] . '";';
        }, $str);
    }

    //获取佣金比例
    public function getCommission()
    {
        $value = Db::table('bbc_ssys_setting')->where('name', '=', 'ssys_yj_percent')->get();
        $data = $this->mb_unserialize($value);
        return unserialize(json_decode($data, 1)[0]['value']);
    }

    /**

     * @Get(path="/api/v1/getYj",tags={"获取VendorValidate佣金金额"},summary="获取佣金金额",
     *     @Parameter(name="gid",description="商品id",required=true,in="query",@Schema(type="string")),
     *     @Parameter(name="member_id",description="推手会员",required=true,in="query",@Schema(type="string")),
     *     @Parameter(name="spreader_deep",description="第几级佣金,最多三级",required=true,example="1",in="query",@Schema(type="string")),
     *     @Response(response="200",description="请求成功"),
     *     @Response(response="400",description="请求失败"),
     * )
     *      * @param $gid
     * @param $member_id
     * @param int $spreader_deep
     * @return float|int
     */
    //获取佣金金额
    public function getGoodsCommission($gid, $member_id, $spreader_deep = 1)
    {
        $yj_percent = 100;
        $commission = 0;
        $technical =1/100;//技术服务费
        $cash=0.6/100;//提现手续费
        $commissionrate = $this->getCommission();
        if (is_array($commissionrate) && !empty($commissionrate)) {
            switch ($spreader_deep) {
                case '1':
                    $yj_percent = (isset($commissionrate['b']) && $commissionrate['b'] > 0) ? $commissionrate['b'] : 1;
                    break;
                case '2':
                    $yj_percent = (isset($commissionrate['c']) && $commissionrate['c'] > 0) ? $commissionrate['c'] : 1;
                    break;
                case '3':
                    $yj_percent = (isset($commissionrate['d']) && $commissionrate['d'] > 0) ? $commissionrate['d'] : 1;
            }
        }

        $ssys_goods = db::table('ssys_goods')->where('gid', '=', $gid)->select()->get();
        foreach ($ssys_goods as $key => $ssys_goods_info) {
            if (isset($ssys_goods_info['gid']) && !empty($ssys_goods_info['gid'])) {
                $g_name = Db::table('bbc_ssys_goods_cates')->where('id', '=', $ssys_goods_info['gid'])->select('g_name')->get();
                $ssys_goods_info['g_name'] = $g_name;
            }

        }
        if (is_array($ssys_goods) && !empty($ssys_goods) && isset($ssys_goods['yj_amount']) && $yj_percent) {
            $commission=$ssys_goods['yj_amount']*($yj_percent/100)*(1-$technical-$cash);
        }
        return  $commission;
    }
}

