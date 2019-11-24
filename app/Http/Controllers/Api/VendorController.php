<?php

namespace App\Http\Controllers\Api;
use App\Http\Requests\Api\VendorRequest;
use App\Jobs\Api\sendCommission;
use App\Models\BbcVendor;
use App\Models\BbcVendorJoinin;
use Illuminate\Support\Facades\DB;
use OpenApi\Annotations\Parameter;
use OpenApi\Annotations\Post;
use OpenApi\Annotations\Response;
use OpenApi\Annotations\Schema;
class VendorController extends Controller
{

    public function queue($url,$arr){
        dispatch(new sendCommission($url,$arr));
    }
    /**
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     * 商家保证金+功能费+会员费及商家信息
     * @Post(path="/api/v1/vendor/store",tags={"商家费用及信息"},summary="商家费用及信息",
     *      @Parameter(name="member_id",description="会员id",required=true,in="query",@Schema(type="string")),
     *      @Parameter(name="sg_id",description="店铺等级",required=true,in="query",@Schema(type="string")),
     *      @Parameter(name="joinin_year",description="加入年限",required=true,in="query",@Schema(type="string")),
     *      @Parameter(name="func_cost",description="功能费用",required=true,in="query",@Schema(type="string")),
     *      @Parameter(name="store_baozhrmb",description="保证金",required=false,in="query",@Schema(type="string")),
     *      @Response(response="200",description="请求成功"),
     *     @Response(response="400",description="请求失败")
     * )
     */
    //同步商家信息及所缴纳的费用
    public function store(VendorRequest $request)
    {
        //获取商家的member_id
        $member_id = $request->member_id;
        $vendor_info = BbcVendor::where('member_id', $member_id);
        $sg_id = $vendor_info['sg_id'];//店铺等级
        $joinin_year = $vendor_info['joinin_year'];//开店年限
        $result = DB::table("bbc_vendor_joinin")
            ->where("bbc_vendor_joinin.member_id", '=', $member_id)
            ->where("bbc_vendor_joinin.sg_id", string($sg_id))
            ->leftJoin('bbc_store_grade', 'bbc_vendor_joinin.sg_id', '=', 'bbc_store_grade.sg_id')
            ->select('bbc_vendor_joinin.sg_info', 'bbc_store_grade.sg_name', 'bbc_store_grade.sg_price')
            ->get()->toArray();
        $sg_price = (intval($result[0]->sg_price));
        //新增字段功能费:func_cost
        $func_cost = BbcVendor::query()->where('member_id',$member_id)->select('func_cost')->get();//新增功能费
        $deposit = BbcVendor::query()->where('member_id',$member_id)->select('store_baozhrmb')->get();//保证金
        $member_cost=$sg_id * $joinin_year * $sg_price;  //会员费

        $paying_amount = $func_cost + $deposit + $member_cost;// 付款总金额  =功能费+会员费+保证金

        $amount = isset($vendor_info['paying_amount']) ?$vendor_info['paying_amount']: 0;//判断付款总金额的数据库存的值是否与计算的相等
        if ($amount == $paying_amount) {
            //同步k3财务
            $result = $this->PostRequestData(getenv('K3_URL'), [
                'vendor_info' => BbcVendorJoinin::query()->where('member_id', $member_id)->get(),
            ]);
            BbcVendor::update(['process' => '2']);
            return $this->setStatusCode(200)->success($result);
        }
        BbcVendor::update(['process' => '3']);
        return $this->failed('同步失败', 401);
    }
    /**
     * @param VendorRequest $vendorRequest
     * @Post(path="/api/v1/vendorValidate ",tags={"企业工商信息认证(传其一即可)"},summary="企业工商信息认证",
     *     @Parameter(name="business_licence_number",description="营业执照号",required=false,in="query",@Schema(type="string")),
     *     @Parameter(name="organization_code",description="组织机构代码",required=false,in="query",@Schema(type="string")),
     *     @Response(response="200",description="请求成功"),
     *     @Response(response="400",description="请求失败")
     * )
     *
     */
    //企业工商信息认证
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


}

