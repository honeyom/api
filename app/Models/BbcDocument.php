<?php

namespace App\Models;
use App\BaseModel;
class BbcDocument extends BaseModel
{
    //关联商家
    public  function BbcVendorJoinin(){
        return $this->belongsToMany(
            'App\Models\BbcVendorJoinin',
            'vendor_doc',
            'doc_id',
            'member_id',
            'doc_id',
            'member_id');
    }
}
