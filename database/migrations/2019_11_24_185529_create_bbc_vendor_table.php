<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateBbcVendorTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('bbc_vendor', function(Blueprint $table)
		{
			$table->integer('vid', true)->comment('店铺索引id');
			$table->string('store_name', 50)->index('store_name')->comment('店铺名称');
			$table->boolean('store_auth')->nullable()->default(0)->comment('店铺认证');
			$table->boolean('name_auth')->nullable()->default(0)->comment('店主认证');
			$table->integer('grade_id')->comment('店铺等级');
			$table->integer('member_id')->comment('会员id');
			$table->string('member_name', 50)->comment('会员名称');
			$table->string('seller_name', 50)->nullable()->comment('店主卖家用户名');
			$table->string('store_owner_card', 50)->comment('身份证');
			$table->integer('sc_id')->index('sc_id')->comment('店铺分类');
			$table->string('store_company_name', 50)->nullable()->comment('店铺公司名称');
			$table->integer('province_id')->unsigned()->default(0)->comment('店铺所在省份ID');
			$table->integer('city_id')->nullable()->default(0)->comment('所在城市id');
			$table->integer('area_id')->default(0)->index('area_id')->comment('地区id');
			$table->string('area_info', 100)->comment('地区内容，冗余数据');
			$table->string('store_address', 100)->comment('详细地区');
			$table->float('store_longitude', 10, 0)->nullable()->default(0)->comment('店铺经度');
			$table->float('store_latitude', 10, 0)->nullable()->default(0)->comment('店铺纬度');
			$table->string('store_category')->nullable()->comment('找门店店铺分类');
			$table->string('sotre_address')->nullable()->comment('找门店店铺地址');
			$table->string('store_zip', 10)->comment('邮政编码');
			$table->string('store_tel', 50)->comment('电话号码');
			$table->string('store_image', 100)->nullable()->comment('证件上传');
			$table->string('store_image1', 100)->nullable()->comment('执照上传');
			$table->boolean('store_state')->default(2)->index('store_state')->comment('店铺状态，0关闭，1开启，2审核中');
			$table->string('store_close_info')->nullable()->comment('店铺关闭原因');
			$table->integer('store_sort')->default(0)->comment('店铺排序');
			$table->string('store_time', 10)->comment('店铺时间');
			$table->string('store_end_time', 10)->nullable()->comment('店铺关闭时间');
			$table->string('store_label')->nullable()->comment('店铺logo');
			$table->string('store_banner')->nullable()->comment('店铺横幅');
			$table->string('store_avatar')->nullable()->comment('店铺头像');
			$table->string('store_keywords')->default('')->comment('店铺seo关键字');
			$table->string('store_description')->default('')->comment('店铺seo描述');
			$table->string('store_qq', 50)->nullable()->comment('QQ');
			$table->string('store_ww', 50)->nullable()->comment('阿里旺旺');
			$table->string('store_phone', 20)->nullable()->comment('商家电话');
			$table->text('description', 65535)->nullable()->comment('店铺简介');
			$table->text('store_zy', 65535)->nullable()->comment('主营商品');
			$table->string('store_domain', 50)->nullable()->comment('店铺二级域名');
			$table->boolean('store_domain_times')->nullable()->default(0)->comment('二级域名修改次数');
			$table->boolean('store_recommend')->default(0)->comment('推荐，0为否，1为是，默认为0');
			$table->string('store_theme', 50)->default('default')->comment('店铺当前主题');
			$table->integer('store_credit')->default(0)->comment('店铺信用');
			$table->float('praise_rate', 10, 0)->default(0)->comment('店铺好评率');
			$table->float('store_desccredit', 10, 0)->default(0)->comment('描述相符度分数');
			$table->float('store_servicecredit', 10, 0)->default(0)->comment('服务态度分数');
			$table->float('store_deliverycredit', 10, 0)->default(0)->comment('发货速度分数');
			$table->integer('store_collect')->unsigned()->default(0)->comment('店铺收藏数量');
			$table->text('store_slide', 65535)->nullable()->comment('店铺幻灯片');
			$table->text('store_slide_url', 65535)->nullable()->comment('店铺幻灯片链接');
			$table->string('store_stamp', 200)->nullable()->comment('店铺印章');
			$table->string('store_printdesc', 500)->nullable()->comment('打印订单页面下方说明文字');
			$table->integer('store_sales')->unsigned()->default(0)->comment('店铺销量');
			$table->text('store_presales', 65535)->nullable()->comment('售前客服');
			$table->text('store_aftersales', 65535)->nullable()->comment('售后客服');
			$table->string('store_workingtime', 100)->nullable()->comment('工作时间');
			$table->decimal('store_free_price', 10)->unsigned()->default(0.00)->comment('超出该金额免运费，大于0才表示该值有效');
			$table->integer('store_decoration_switch')->unsigned()->default(0)->comment('店铺装修开关(0-关闭 装修编号-开启)');
			$table->boolean('store_decoration_only')->default(0)->comment('开启店铺装修时，仅显示店铺装修(1-是 0-否');
			$table->integer('store_decoration_image_count')->unsigned()->default(0)->comment('店铺装修相册图片数量');
			$table->string('live_store_name')->nullable()->comment('商铺名称');
			$table->string('live_store_address')->nullable()->comment('商家地址');
			$table->string('live_store_tel')->nullable()->comment('商铺电话');
			$table->string('live_store_bus')->nullable()->comment('公交线路');
			$table->boolean('is_own_shop')->default(0)->comment('是否自营店铺 1是 0否');
			$table->boolean('bind_all_gc')->default(0)->comment('自营店是否绑定全部分类 0否1是');
			$table->char('store_vrcode_prefix', 3)->nullable()->comment('商家兑换码前缀');
			$table->boolean('store_baozh')->nullable()->default(0)->comment('保证服务开关');
			$table->boolean('store_baozhopen')->nullable()->default(0)->comment('保证金显示开关');
			$table->string('store_baozhrmb', 10)->nullable()->default('零')->comment('保证金金额');
			$table->boolean('store_qtian')->nullable()->default(0)->comment('7天退换');
			$table->boolean('store_zhping')->nullable()->default(0)->comment('正品保障');
			$table->boolean('store_erxiaoshi')->nullable()->default(0)->comment('两小时发货');
			$table->boolean('store_tuihuo')->nullable()->default(0)->comment('退货承诺');
			$table->boolean('store_shiyong')->nullable()->default(0)->comment('试用中心');
			$table->boolean('store_shiti')->nullable()->default(0)->comment('实体验证');
			$table->boolean('store_xiaoxie')->nullable()->default(0)->comment('消协保证');
			$table->boolean('store_huodaofk')->nullable()->default(0)->comment('货到付款');
			$table->boolean('is_display_shop')->nullable()->default(0)->comment('是否在找门店中显示，0不显示，1显示');
			$table->string('store_offline_label')->nullable()->comment('线下找门店店铺logo（app端使用）');
			$table->boolean('sld_is_supplier')->default(0)->comment('是否为供货商');
			$table->boolean('cash_on_delivery')->nullable()->default(0)->comment('是否支持货到付款');
			$table->boolean('grade_on_price')->nullable()->default(0)->comment('是否支持会员等级折扣');
			$table->integer('label_id')->nullable()->comment('店铺标签id');
			$table->string('sett_type', 10)->nullable()->default('cn')->comment('结算 货币');
			$table->integer('store_type')->default(1)->comment('默认为1 个人 2为企业');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('bbc_vendor');
	}

}
