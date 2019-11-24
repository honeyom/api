<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\Api\ApplayRefoundRequest;
use App\Jobs\Api\sendCommission;
use App\Models\BbcOrder;
use Illuminate\Http\Request;

class ReturnController extends Controller
{

        const REFUND_TYPE   = 1;
        const AGREE_REFOUND = 2;
        const REFUND_STATUS = 3;

        //退款接口
        public function applayRefound(BbcOrder $order, ApplayRefoundRequest $request)
        {
            //如果不是退款类型
            if (self::REFUND_TYPE !== $order->refund_type) {
                return $this->failed('同步异常', 401);
            }
            //如果卖家还没同意
            if (self::AGREE_REFOUND !== $order->seller_state) {
                return $this->failed('同步异常',402);
            }
            //如果管理员还没处理
            if(self::REFUND_STATUS !==$order->refund_state){
                return $this->failed('同步异常',403);
            }
            if(!$request->reason_info){
                return $this->failed('请填写申请理由',404);
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
