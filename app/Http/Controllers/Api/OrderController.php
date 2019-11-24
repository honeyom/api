<?php
/**
 * 订单支付后对接财务系统
 */
namespace App\Http\Controllers\Api;

use App\Events\OrderPaid;
use App\Jobs\Api\sendCommission;
use App\Models\BbcOrder;
use App\Models\BbcOrderBill;
use Illuminate\Http\Request;
use OpenApi\Annotations\Parameter;
use OpenApi\Annotations\Put;
use OpenApi\Annotations\Response;
use OpenApi\Annotations\Schema;


class OrderController extends Controller
{

    /**
     * @Put(path="/api/v1/order/sync",tags={"同步订单接口"},summary="同步订单接口",
     *    @Parameter(name="order_sn",description="订单号",in="query",@Schema(type="string")),
     *      @Response(response="200",description="请求成功"),
     *     @Response(response="400",description="请求失败")
     * )
     *
     */
    //同步订单接口
   public function payAfter(Request $request){
       //订单支付成功后触发事件
       $orderInfo=BbcOrder::query()->where('order_sn',$request->orderno);
        event(new OrderPaid($request->orderno));
        $result=$this->dispatch(new sendCommission(getenv('K3_URL'),$orderInfo));
       if($result){
           //某个同步失败的标记
           if($result['code']==23){
           BbcOrder::update(['process'=>3,]);
           }
           //同步成功
           BbcOrder::update(['process'=>2,]);
       }
   }
   //订单结算同步
   public function settlement(BbcOrderBill $order){
            $result=$this->dispatch(new sendCommission(getenv('K3_URL'),$order));
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
