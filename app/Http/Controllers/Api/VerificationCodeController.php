<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\Api\VerificationCodeRequest;
use App\Models\BbcMember;
use Illuminate\Filesystem\Cache;
use Illuminate\Http\Request;
use OpenApi\Annotations\Parameter;
use OpenApi\Annotations\Post;
use OpenApi\Annotations\Response;
use Yunpian\Sdk\YunpianClient;
class VerificationCodeController extends Controller
{



    //注册使用的验证码
    public function RegisterCode(Request $request){
        $phone=$request->phone;
        //左侧补0,生成5位随机码
        $code=str_pad(random_int(1,99999),5,0,STR_PAD_LEFT);
        $clnt=YunpianClient::create(getenv('YUNPIAN_API_KEY'));
        $param=[
            YunpianClient::MOBILE=>"{$phone}",
            YunpianClient::TEXT=>"【海云舟】感谢您选择海云舟，您的注册验证码是{$code}。海云舟，您的培训服务交易平台。",
        ];
        $result=$clnt->sms()->single_send($param);
        return $result;
    }


    /**
     *
     * @Post(path="/api/v1/returnHome",tags={"入驻完成后的跳转地址"},summary="入驻完成后的跳转地址",
     *     @Parameter(name="phone",description="手机号码",required=true,in="query",allowEmptyValue=false,example="18380364842",@Schema(type="string")),
     *     @Response(response="200",description="响应成功"),
     *     @Response(response="400",description="响应失败")
     *
     * )
     */


    //个人入驻和企业入驻使用的验证码
    public function returnHomeUrlCode(Request $request){
        $phone=$request->phone;
        //左侧补0,生成5位随机码
        $code=str_pad(random_int(1,99999),5,0,STR_PAD_LEFT);
        $clnt=YunpianClient::create(getenv('YUNPIAN_API_KEY'));
        $param=[
            YunpianClient::MOBILE=>"{$phone}",
            YunpianClient::TEXT=>"【海云舟】恭喜您开店成功！商家后台地址为：www.horizou.cn/vendor（请使用PC端访问），登陆账号为注册海云舟平台时的账号，请勿透露给他人；海云舟，综合服务交易平台。",
        ];
        $result=$clnt->sms()->single_send($param);
        return $result;
    }




    public function validateCode(Request $request){
        $phone=$request->phone;
        //左侧补0,生成5位随机码
        $user_name=BbcMember::where('member_id',$request->member_id)->select('member_truename')->get();
        $user_name=$user_name[0]['member_truename'];
        $code=str_pad(random_int(1,99999),5,0,STR_PAD_LEFT);
        $expiredAt=now()->addMinutes(5);
        $expiredAt=(strtotime($expiredAt)-time())/60 .'分钟';
        $clnt=YunpianClient::create(getenv('YUNPIAN_API_KEY'));
        $param=[
            YunpianClient::MOBILE=>"{$phone}",
            YunpianClient::TEXT=>"【海云舟】亲爱的{$user_name}，您的验证码是{$code}。有效期为{$expiredAt}，请尽快验证",
        ];
        $result=$clnt->sms()->single_send($param);
        if(0 !== intval(json_decode($result)) ){
            return $this->failed('短信商内部错误,请调试返回码',404);
        }
        return $this->setStatusCode(200)->success($result);
        }
}
