<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\Api\VendorRequest;
use App\Models\BbcVendorJoinin;
use App\Models\VendorDoc;


class ContractController extends Controller
{
    //
    public function store(VendorRequest $vendorRequest,BbcVendorJoinin $bbcVendorJoinin){
        //把入驻商家关联到合同中间表
        $member_id=$vendorRequest->member_id;
        VendorDoc::create([
            'member_id'=>$member_id,
            'doc_id'=>4,
        ]);

        //对接k3合同,同步
        //第一种方法:使用自身SyncContract
//        $this->SyncContract($member_id);

        //第二种方法使用helpers同步函数
        $result=$this->PostRequestData(getenv('K3_URL'),[
            'data'=>[
            'member_id'=>$bbcVendorJoinin->member_id,
            'member_name'=>$bbcVendorJoinin->member_name,
            'contract'=>BbcVendorJoinin::where('member_id','=',$bbcVendorJoinin->member_id)->BbcVendorJoinin(),
            ]
        ]);
        //请求之后就同步...
        VendorDoc::update(['process'=>1]);
        if($result){
            if($result=='23'){
                VendorDoc::update(['process'=>3]);
            }
            VendorDoc::update([
                'process'=>2,
            ]);
            //某失败的标记,

            return $this->setStatusCode(200)->success($result);
        }
        return $this->failed('同步失败',400);

    }



//    public function SyncContract(BbcVendorJoinin $bbcVendorJoinin){
//        $http = new Client();
//        //同步k3合同的请求地址
//        $response = $http->post(getenv('K3_URL'), [
//            'form_params' => [
//                'member_id'=>$bbcVendorJoinin->member_id,
//                'member_name'=>$bbcVendorJoinin->member_name,
//                'contract'=>BbcVendorJoinin::where('member_id','=',$bbcVendorJoinin->member_id)->BbcVendorJoinin(),
//            ],
//        ]);
//        $mess=json_decode((string) $response->getBody(), true);
//        return $this->setStatusCode(201)->success($mess);
//    }
}
