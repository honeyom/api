<?php

namespace App\Http\Controllers\Api;
use App\Http\Requests\Api\ApplayRefoundRequest;
use App\Jobs\Api\sendCommission;
use App\Models\BbcOrder;
use Illuminate\Http\Request;
use OpenApi\Annotations\Parameter;
use OpenApi\Annotations\Put;
use OpenApi\Annotations\Response;
use OpenApi\Annotations\Schema;

class ReturnController extends Controller
{

    const REFUND_TYPE =1;
    const SELLER_STATE=2;
    const REFUND_STATE=3;

    /**
    /**
     * @Put(path="/api/v1/order/return",tags={"同步退款接口"},summary="同步退款接口",
     *    @Parameter(name="order_sn",description="订单号",in="query",@Schema(type="string")),
     *      @Response(response="200",description="请求成功"),
     *     @Response(response="400",description="请求失败")
     * )
     *
     */
        //退款接口
        public function applayRefound(BbcOrder $order ,ApplayRefoundRequest $request)
        {
            //如果不是退款类型
            if (self::REFUND_TYPE !== $order->refund_type) {
                return $this->failed('同步异常', 401);
            }
            //如果卖家还没同意
            if (self::SELLER_STATE !== $order->seller_state) {
                return $this->failed('同步异常',402);
            }
            //如果管理员还没处理
            if(self::REFUND_STATE !==$order->refund_state){
                return $this->failed('同步异常',403);
            }
            if(!$request->reason_info){
                return $this->failed('请填写申请理由',404);
            }
            if(!$request->refund_sn){
                return $this->failed('退款单号不存在,请重新检查',405);
            }
            $requestData=BbcOrder::query()->where('order_sn',$request->input('order_sn'))->get();
            $result=$this->dispatch(new sendCommission(getenv('K3_URL'),$requestData));
            if($result){
                //某个同步失败的标记
                if($result['code']==23){
                    BbcOrder::update(['process'=>3,]);
                }
                //同步成功
                BbcOrder::update(['process'=>2,]);
            }

        }


}
