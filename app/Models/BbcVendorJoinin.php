<?php

namespace App\Models;

use App\BaseModel;
class BbcVendorJoinin extends BaseModel
{
    //关联合同
    public  function BbcDocument(){
//        return $this->belongsToMany(
//            BbcDocument::class,
//            'vendor_doc',
//            'member_id',
//            'doc_id',
//            'member_id',
//            'doc_id')->withPivot();
        return $this->belongsToMany(
            BbcDocument::class,
            'vendor_doc',
            'member_id',
            'doc_id',
            'member_id',
            'doc_id');

    }
}
