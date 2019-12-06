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

    /**
     * @Put(path="/api/v1/order/settle",tags={"同步结算接口"},summary="同步结算接口",
     *    @Parameter(name="order_sn",description="订单号",in="query",@Schema(type="string")),
     *      @Response(response="200",description="请求成功"),
     *     @Response(response="400",description="请求失败")
     * )
     *
     */
   //订单结算同步
   public function settlement(BbcOrderBill $order){



            $result=$this->dispatch(new sendCommission(getenv('K3_URL'),$order));
        if($result){
           //某个同步失败的标记
           if($result['code']==23){
               BbcOrderBill::update(['process'=>3,]);
           }
           //同步成功
            BbcOrderBill::update(['process'=>2,]);
       }
   }


    /**
     *
     *
     */
    public function settlementInsert()
    {
        //ob_no=date('Y-m',time()).$data['vid']
        //ob_start_date=$data['finnshed_time'] 直接是时间戳
        //ob_order_totals=$data['order_amount']//订单总金额
        //ob_order_refound_offline=0//货到付款退款金额
        //ob_shipping_totals=0；//运费
        //ob_order_return_totals=$data['refund_amount']//退单金额
        //ob_commis_totals=佣金金额//
        //order_yongjin_totals=订单的商品分销佣金
        //ob_commis_return_totals=$data['order_amount']-$data['refund_amount']//退还佣金
        //ob_store_cost_totals=$data['red_money']//店铺促销活动费用
        //ob_result_totals=应结金额
        //
        //$data['order_amount']+$data['pd_points']-order_yongjin_totals-$data['refund_amount']+ob_commis_return_totals-$data['red_money']
        //
        //180.00 (订单金额) +0.00(积分金额) - 0.00(货到付款金额) - 0.00 (佣金金额) - 0 (退单金额) + 0.00 (退还佣金) - 0.00 (促销费用)
        //
        //ob_pd_points=$data['pd_points']//积分金额





   }

}
