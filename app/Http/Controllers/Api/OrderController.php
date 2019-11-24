<?php
/**
 * 订单支付后对接财务系统
 */
namespace App\Http\Controllers\Api;

use App\Events\OrderPaid;
use App\Jobs\Api\sendCommission;
use App\Models\BbcOrder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use OpenApi\Annotations\Parameter;
use OpenApi\Annotations\Put;
use OpenApi\Annotations\Response;
use OpenApi\Annotations\Schema;


class OrderController extends Controller
{
    /***
     * @param Request $request
     * @Put(path="/api/v1/payOrderInfo",tags={"同步订单信息"},summary="同步订单信息",
     *     @Parameter(name="orderno",description="订单号",required=true,in="query",@Schema(type="string")),
     *     @Response(response="200",description="请求成功"),
     *     @Response(response="400",description="同步失败")
     * )
     */
   public function payAfter(Request $request){
       //订单支付成功后触发事件
       $orderInfo=BbcOrder::query()->where('orderno',$request->orderno);
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
}
