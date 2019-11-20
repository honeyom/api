<?php
/**
 * SyncFunc.php
 * @Author:代先华
 * @PROJECT_NAME:apiserver
 * @PRODUCT_NAME:PhpStorm
 * @Last Modified by:Administrator
 * @Last Modified time:2019-11-5  16:56
 * @MONTH_NAME_FULL:十一月
 */

namespace App\Api\Helpers;


use GuzzleHttp\Client;

trait SyncFunc
{
    protected $url;

    public  function getUrl($url){
        if (isset($url)){
            $this->url=$url;
        return  $url;
        }
        return $this->url;
    }
    public function PostRequestData($url=null,array $data){
        $request=new Client();
        $response = $request->post(($this->getUrl($url)), ['query'=>$data]);
        $mess=json_decode((string) $response->getBody(), true);
        return $mess;
    }
    public  function GetRequestDate($url=null,array $data){
        $request=new Client();
        $response = $request->get(($this->getUrl($url)), ['query'=>$data]);
        $mess=json_decode((string) $response->getBody(), true);
        return $mess;
    }


}
