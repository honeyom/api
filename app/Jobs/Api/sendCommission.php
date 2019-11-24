<?php

namespace App\Jobs\Api;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

class sendCommission implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $url;
    protected $arr;
    /**
     * Create a new job instance.
     * @return void
     */
    public function __construct($url,array $arr)
    {
        //
        $this->url=$url;
        $this->arr=$arr;

    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
         $result=$this->PostRequestData($this->url,$this->arr);
         return $result;
    }
}

// .env设置为redis,
//然后安装composer require predis/predis
//启动队列处理器php artisan queue:work