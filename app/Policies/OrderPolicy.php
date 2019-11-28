<?php

namespace App\Policies;

use App\Models\BbcMember;
use App\Models\BbcOrder;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class OrderPolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }
    public function owen(BbcMember $member,BbcOrder $order){
            return $order->member_id==$member->memeber_id;
    }
}
