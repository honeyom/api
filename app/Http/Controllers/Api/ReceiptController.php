<?php

//发票信息
namespace App\Http\Controllers\Api;

use App\Models\BbcInvoice;
use Illuminate\Http\Request;
class ReceiptController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     *
     */
    public function store(Request $request)
    {
        //
        /** @var TYPE_NAME $request */
        /** @var TYPE_NAME $result */
            $result=$this->PostRequestData(getenv('K3_URL'),$request->all());
        BbcInvoice::update(['process'=>1]);
        if($result){
            BbcInvoice::update([
                'process'=>2,
            ]);
            //某失败的标记,
            if($result=='23'){
                BbcInvoice::update(['process'=>3]);
            }
            return $this->setStatusCode(200)->success($result);
        }
        return $this->failed('同步失败',400);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
