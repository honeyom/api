<?php

use Illuminate\Http\Request;

Route::namespace('Api')->prefix('v1')->middleware('cors')->group(function () {
    //用户注册
    Route::get('/test','VendorController@test');
    Route::get('/sendYj','VendorController@sendYj');//修改佣金
    Route::get('/getYj','VendorController@getGoodsCommission');//获取佣金金额
    Route::get('/getCon','VendorController@getCommission');//佣金比例
    Route::get('/requestChain','VendorController@requestChain')->name('verify.data');
    Route::post('/encode','VendorController@enLogindata');
    Route::post('/vendorValidate','VendorController@VendorValidate')->name('verify.vendor');//企业工商信息认证
    Route::post('/personalInfo','UserController@personalInfo')->name('verify.personal');//身份证实名认证
//    Route::post('/invoice','InvoiceController@index');//增开电子发票
    Route::post('/queue','VendorController@queue');//队列
    Route::post('/users','UserController@store')->name('users.store');
    //用户登录
    Route::post('/login','UserController@login')->name('users.login');
    Route::middleware('api.refresh')->group(function () {
        //当前用户信息
        Route::get('/users/info','UserController@info')->name('users.info');
        //用户列表
        Route::get('/users','UserController@index')->name('users.index');
        //用户信息
        Route::get('/users/{user}','UserController@show')->name('users.show');
        //用户退出
        Route::get('/logout','UserController@logout')->name('users.logout');
        //商家入驻关联合同入口
        Route::post('contract/store','ContractController@store')->name('contract.store');//新入驻商家自动同步合同,
        Route::get('vendor/store','VendorController@store')->name('vendor.store');//保证金,功能费,会员费,平台应收
        Route::post('receipt/store','ReceiptController@store')->name('receipt.store');//发票信息,发票信息

    });
});
