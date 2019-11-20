<?php
/**
 * RsaHandle.php
 * @Author:代先华
 * @PROJECT_NAME:apiserver
 * @PRODUCT_NAME:PhpStorm
 * @Last Modified by:Administrator
 * @Last Modified time:2019-11-8  20:23
 * @MONTH_NAME_FULL:十一月
 */

namespace App\Api\Helpers;


class RsaHandle
{
    //公钥加密
    public static function enPublic($data){
        $path=base_path();
        $publicKey=openssl_get_publickey(file_get_contents($path.'/sec/rsa_public_key.pem'));
        openssl_public_encrypt($data,$encrypted,$publicKey);
        $base64Encoded=base64_encode($encrypted);
        return $base64Encoded;
    }
//    私钥解密
    public static function dePrivate($data){
        $path=base_path();
        $privateKey=openssl_get_privatekey(file_get_contents($path.'/sec/rsa_private_key.pem'));
        openssl_private_decrypt(base64_encode($data),$descryted,$privateKey);
        return $descryted;
    }
//    私钥加密
    public static function enPrivate($data){
        $path=base_path();
        $privatekey=openssl_get_privatekey(file_get_contents($path.'/sec/rsa_private_key.pem'));
        openssl_private_encrypt($data,$encrypted,$privatekey);
        $base64Encode=base64_encode($encrypted);
        return $base64Encode;
    }
//    公钥解密
    public static function dePublic($data){
     $path=base_path();
     $publickey=openssl_get_publickey(file_get_contents($path.'/sec/rsa_public_key.pem'));
     openssl_public_decrypt(base64_decode($data),$decrypted,$publickey);
     return $decrypted;
}



}
