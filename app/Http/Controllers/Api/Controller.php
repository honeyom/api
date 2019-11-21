<?php
/**
 * Controller.php
 * @Author:代先华
 * @PROJECT_NAME:apiserver
 * @PRODUCT_NAME:PhpStorm
 * @Last Modified by:Administrator
 * @Last Modified time:2019-11-5  7:09
 * @MONTH_NAME_FULL:十一月
 */
namespace App\Http\Controllers\Api;

use App\Api\Helpers\ApiResponse;
use App\Api\Helpers\SyncFunc;
use App\Http\Controllers\Controller as BaseController;

class Controller extends BaseController
{

    use ApiResponse,SyncFunc;
    // 其他通用的Api帮助函数
}