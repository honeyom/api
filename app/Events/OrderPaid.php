<?php

namespace App\Events;

use App\Models\BbcOrder;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class OrderPaid
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    protected $order;
    public function __construct(BbcOrder $order)
    {
        //
        $this->order=$order;

    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PrivateChannel('channel-name');
    }
    public function getOrderInfo(){
        return $this->order;
    }
}


/***
 * 1.php artisan make:event创建事件
 * 2.在控制器中触发事件, protected function afterPaid(Order $order)
    {
        event(new OrderPaid($order));
}
 * 3.创建事件监听器php artisan make:listener UpdateProductSoldCount --event=OrderPaid
 * 4.关联事件和监听器app/Providers/EventServiceProvider.php添加事件类
 * 5.创建通知类php artisan make:notification,并创建通知类监听器
 * 6.在新创建的通知类监听器中添加通知$order->user->notify(new OrderPaidNotification($order));
 * 7.启动队列处理php artisan queue:work
 */
