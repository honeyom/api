<?php

Route::namespace('Api')->prefix('v1')->middleware('cors')->group(function () {
    Route::post('/login','UserController@login')->name('users.login');//用户登录(获取token信息接口)
    Route::group([
        'middleware'=>'api.throttle',
        'limit'=>config('app.rate_limits.sign.limit'),
        'expires'=>config('app.rate_limits.sign.expires'),
    ],function (){
        Route::post('verificationCode', 'VerificationCodeController@store')->name('api.verificationCodes.store');//短信验证码接口
        Route::post('users', 'UserController@store')->name('api.users.store');//用户注册接口
        Route::post('use_phone', 'UserController@store1')->name('api.users.store');//用户注册接口(带手机号码和验证码))
        Route::post('/personalInfo','UserController@personalInfo')->name('verify.personal');//身份证实名认证

    });

    Route::middleware('api.refresh')->group(function () {

        Route::get('/users/info','UserController@info')->name('users.info');//当前用户信息

        Route::get('/users','UserController@index')->name('users.index');//用户列表

        Route::get('/users/{user}','UserController@show')->name('users.show');//用户信息

        Route::get('/logout','UserController@logout')->name('users.logout');  //用户退出

    });
    Route::get('vendor/store','VendorController@store')->name('vendor.store');//同步商家信息及所缴纳的费用
    Route::get('vendor/VendorValidate','VendorController@VendorValidate')->name('vendor.VendorValidate');//企业工商信息认证



    Route::get('chain/test','ChainController@test')->name('Chain.test');//区块链加解密测试
    Route::get('chain/requestChain','ChainController@requestChain')->name('Chain.requestChain');//携带token请求区块链浏览器

    Route::post('contract/store','ContractController@store')->name('contract.store');//新入驻商家自动同步合同,  //商家入驻关联合同入口




    Route::put('order/sync','OrderController@payAfter')->name('OrderController.payAfter');//同步订单接口
    Route::put('order/settle','OrderController@payAfter')->name('OrderController.settle');//订单结算同步
    Route::put('order/return','ReturnController@applayRefound')->name('ReturnController.applayRefound');//订单退款同步




    Route::get('/sendYj','CommissionController@sendYj');//修改佣金比例
    Route::get('/getYj','CommissionController@getGoodsCommission');//获取佣金金额
    Route::get('/getCon','CommissionController@getCommission');//获取佣金比例



//    Route::post('/invoice','InvoiceController@index');//增开电子发票
    Route::post('/queue','VendorController@queue');//队列
    Route::post('/users','UserController@store')->name('users.store');

    Route::post('receipt/store','ReceiptController@store')->name('receipt.store');//发票信息,发票信息
    //用户登录


});
