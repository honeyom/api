<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\Api\UserRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use OpenApi\Annotations\Contact;
use OpenApi\Annotations\Info;
use OpenApi\Annotations\Parameter;
use OpenApi\Annotations\Post;
use OpenApi\Annotations\Response;
use OpenApi\Annotations\Schema;
use OpenApi\Annotations\Server;

/**
 *  @Info(version="3.0",title="API文档中心",
 *     @Contact(name="代先华",url="hc1989.com",email="d536819@sina.cn")
 * ),
 * @Server(url="http://106.54.212.105:8088")

 */
class UserController extends Controller

{

    //返回用户列表
    public function index()
    {
        //3个用户为一页
        $users = User::paginate(3);
        return UserResource::collection($users);
    }

    //返回单一用户信息
    public function show(User $user)
    {
        return $this->success(new UserResource($user));
    }

    //用户注册

    /**
     * @param UserRequest $request
     * @return mixed
     * @Post(path="/api/v1/users",tags={"用户注册"},summary="用户注册地址",
     *
     *     @Parameter(name="name",description="用户名",required=true,in="query",style="form",allowEmptyValue=false,example="ddd",style="form",explode=true,@Schema(type="string")),
     *     @Parameter(name="password",description="密码",required=true,in="query",style="form",allowEmptyValue=false,example="123456",explode=true,@Schema(type="string")),
     *     @Response(response="200",description="响应成功"),
     *     @Response(response="400",description="响应失败")
     *
     * )
     */
    public function store(UserRequest $request)
    {
        User::create($request->all());
        return $this->setStatusCode(201)->success('用户注册成功');
    }
    /**
     * @Post(path="/api/v1/login",tags={"获取token值"},summary="返回用户登陆的token值",
     *     @Parameter(name="name",description="登录名",required=true,in="query",example="xander13",@Schema(type="string")),
     *     @Parameter(name="password",description="登陆密码",required=true,in="query",example="123456",@Schema(type="string")),
     *     @Response(response="201",description="请求成功"),
     *     @Response(response="400",description="请求失败")
     * )
     */
    public function login(Request $request)

    {
        $token = Auth::guard('api')->attempt(['name' => $request->name, 'password' => $request->password]);
        if ($token) {
            return $this->setStatusCode(201)->success(['token' => 'bearer ' . $token]);
        }
        return $this->failed('账号或密码错误', 400);
    }

//用户退出
    public function logout()
    {
        Auth::guard('api')->logout();
        return $this->success('退出成功...');
    }

//返回当前登录用户信息
    public function info()
    {
        $user = Auth::guard('api')->user();
        return $this->success(new UserResource($user));
    }


    /**
     * @param $key
     * @param Request $request
     * @return mixed
     *   /**
     * @Post(path="/api/v1/personalInfo",tags={"身份证实名认证"},summary="身份证实名认证",
     *     @Parameter(name="idcard",description="身份证号码",required=true,in="query",example="513022199107121677",@Schema(type="string")),
     *     @Parameter(name="realname",description="姓名",required=true,in="query",example="代先华",@Schema(type="string")),
     *     @Response(response="205",description="请求成功"),
     *     @Response(response="400",description="请求失败")
     *
     * )
     */

    public function personalInfo(Request $request)
    {
        $key=getenv('juhePersonalAppkey');
        $idcard=$request->idcard;//身份证号码
        $realname=$request->realname;//姓名

        $result=$this->PostRequestData(getenv('juhePersonalApi'),[
            'key'=>$key,
            'idcard'=>$idcard,
            'realname'=>$realname,
        ]);
        if(0 !== intval($result['error_code'])) {
           return  $this->failed('认证失败', $result->error_code);
        }
        if(1==$result['result']['res']){
            return $this->setStatusCode(205)->success('success');
        }
        return $this->failed('认证失败', 400);

    }
}
