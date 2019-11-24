<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\VerificationCodeRequest;
use Illuminate\Filesystem\Cache;
use Illuminate\Http\Request;
use Overtrue\EasySms\EasySms;
use Overtrue\EasySms\Exceptions\NoGatewayAvailableException;

class VerificationCodeController extends Controller
{
    //
    public function store(VerificationCodeRequest $request,EasySms $easySms){
        $phone=$request->phone;
        //左侧补0,生成5位随机码
        $code=str_pad(random_int(1,99999),5,0,STR_PAD_LEFT);
        try{
            $result=$easySms->send($phone,[
                'content'=>"【海云舟】感谢您选择海云舟,您的注册验证码是{$code}。海云舟,您的培训服务交易平台"
            ]);
        }catch (NoGatewayAvailableException $exception){
                $message=$exception->getMessage('yunpian')->getMessage();
                return $this->response->errorInternal($message ?: '短信发送异常');
        }
        $key='Code'.str_random(15);
        $expiredAt=now()->addMinutes(10);
        Cache::put($key,['phone'=>$phone,'code'=>$code],$expiredAt);
        return $this->response->array([
            'key'=>$key,
            'expired_at'=>$expiredAt->toDateTimeString(),
        ])->setStatusCode(201);
    }
}
