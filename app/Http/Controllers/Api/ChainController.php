<?php

namespace App\Http\Controllers\Api;

use App\Api\Helpers\RsaHandle;
use Carbon\Carbon;
use Illuminate\Support\Facades\Cache;
use OpenApi\Annotations\Get;
use OpenApi\Annotations\Parameter;
use OpenApi\Annotations\Response;
use OpenApi\Annotations\Schema;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;

class ChainController extends Controller
{
    //
    /**
     * @Get(path="/api/v1/chain/test",tags={"区块链加解密测试"},summary="区块链加解密测试",
     *    @Parameter(name="",description="",in="query",@Schema(type="string")),
     *      @Response(response="200",description="请求成功"),
     *     @Response(response="400",description="请求失败")
     * )
     */
    public function test()
    {
        $data = 'data,im testdata';
        echo 'base64:' . base64_encode($data) . '<br>';
        echo $data . '<br>';
        echo 'encrypted by public key<br>';
        $encrypted = RsaHandle::enPrivate($data);
        echo $encrypted . '<br>';
        $decrypted = RsaHandle::dePublic($encrypted);
        echo $decrypted . '<br>';
    }
    /**
     * @return mixed
     * @throws TokenExpiredException
     * @Get(path="/api/v1/chain/requestChain",tags={"请求区块链浏览器"},summary="请求区块链的原始数据,跳转到enLogindata处理业务,产生加密token",
     *     @Parameter(name="name",description="携带的用户名",allowEmptyValue=true,in="query",@Schema(type="string")),
     *     @Response(response="200",description="请求成功"),
     *     @Response(response="400",description="请求失败")
     * )
     */
    public function requestChain($name='')
    {
//        $key=str_pad(random_int(1, 9999), 6, 0, STR_PAD_LEFT)."@verify@".str_random(15).md5(uniqid());
	$keydata=$this->GetRequestData('http://52.82.73.52:8080/auth/nonce',['']);
	return $keydata;
	$key=$keydata['result'];
        //$key = "@verify@";
        $name = isset($name)?$name:'horizou';
        $expiredAt = strtotime(now()->addMinutes(1));
//        $time=date('Y-m-d H:i:s',$expiredAt);
        Cache::put($key, ['name' => $name], $expiredAt);
        $result = [
            'key' => $key,
            'name' => $name,
            'expired_time' => $expiredAt,
        ];
        return $this->enLogindata($result);
    }

    public function enLogindata($request)
    {
        $requestDate = Cache::get($request['key']);
        if (!$requestDate) {
            return $this->failed('faild', 403);
        }
        $equl = $request['expired_time'] - (strtotime(Carbon::now()));
        if ($equl < 0) {
            Cache::forget($request['key']);
            throw new TokenExpiredException('failed');
        }
        $encrypted = RsaHandle::enPrivate(json_encode($request));
        echo "加密字符:<br>" . $encrypted . "<br>";
        //todo 请求区块链浏览器地址
        $deresult = RsaHandle::dePublic($encrypted);
        echo "解密字符串:<br>" . $deresult;
//        return  "token?".$encrypted;
    }
}
