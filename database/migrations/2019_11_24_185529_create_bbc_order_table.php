<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateBbcOrderTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('bbc_order', function(Blueprint $table)
		{
			$table->integer('order_id', true)->comment('订单索引id');
			$table->bigInteger('order_sn')->unsigned()->comment('订单编号');
			$table->bigInteger('pay_sn')->unsigned()->comment('支付单号');
			$table->integer('vid')->unsigned()->comment('卖家店铺id');
			$table->string('store_name', 50)->comment('卖家店铺名称');
			$table->integer('buyer_id')->unsigned()->comment('买家id');
			$table->string('buyer_name', 50)->comment('买家姓名');
			$table->string('buyer_email', 80)->nullable()->comment('买家电子邮箱');
			$table->integer('add_time')->unsigned()->default(0)->comment('订单生成时间');
			$table->char('payment_code', 15)->default('')->comment('支付方式名称代码');
			$table->integer('payment_time')->unsigned()->nullable()->default(0)->comment('支付(付款)时间');
			$table->integer('finnshed_time')->unsigned()->default(0)->comment('订单完成时间');
			$table->decimal('goods_amount', 10)->unsigned()->default(0.00)->comment('商品总价格');
			$table->decimal('order_amount', 10)->unsigned()->default(0.00)->comment('订单总价格');
			$table->decimal('pd_amount', 10)->unsigned()->default(0.00)->comment('预存款支付金额');
			$table->decimal('shipping_fee', 10)->unsigned()->nullable()->default(0.00)->comment('运费');
			$table->enum('evaluation_state', array('0','1'))->nullable()->default('0')->comment('评价状态 0未评价，1已评价');
			$table->enum('order_state', array('0','10','20','30','40'))->default('10')->comment('订单状态：0(已取消)10(默认):未付款;20:已付款;30:已发货;40:已收货;');
			$table->boolean('refund_state')->nullable()->default(0)->comment('退款状态:0是无退款,1是部分退款,2是全部退款');
			$table->boolean('lock_state')->nullable()->default(0)->comment('锁定状态:0是正常,大于0是锁定,默认是0');
			$table->boolean('delete_state')->default(0)->comment('删除状态0未删除1放入回收站2彻底删除');
			$table->decimal('refund_amount', 10)->nullable()->default(0.00)->comment('退款金额');
			$table->integer('delay_time')->unsigned()->nullable()->default(0)->comment('延迟时间,默认为0');
			$table->enum('order_from', array('1','2'))->default('1')->comment('1WEB2mobile');
			$table->integer('chain_code')->unsigned()->default(0)->comment('门店提货码');
			$table->boolean('chain_id')->default(0)->comment('自提门店ID');
			$table->string('shipping_code', 50)->nullable()->default('')->comment('物流单号');
			$table->integer('dian_id')->nullable()->default(0)->comment('0不是自提 直接存自提id');
			$table->integer('to_dian')->nullable()->default(0)->comment('门店发货 门店id');
			$table->integer('pin_id')->nullable()->default(0)->comment('拼团id');
			$table->boolean('ziti')->nullable()->default(1)->comment('是否是自提 默认1 是自提');
			$table->integer('pd_points')->nullable()->default(0)->comment('使用多少积分参与抵现');
			$table->integer('red_id')->nullable()->comment('优惠券id');
			$table->decimal('red_money', 10)->nullable()->comment('平台优惠卷金额,结算时用得到');
			$table->integer('vred_id')->nullable()->comment('店铺优惠券id');
			$table->bigInteger('is_check')->nullable()->comment('1已核对');
			$table->integer('service_id')->nullable()->comment('客服id');
			$table->integer('service_time')->nullable()->comment('跟客服接入的时间');
			$table->boolean('points_ratio')->nullable()->comment('积分当时比率');
			$table->integer('pin_order_id')->nullable()->default(0)->comment('阶梯团购订单表id');
			$table->integer('pre_order_id')->nullable()->default(0)->comment('预售订单表id');
			$table->boolean('order_course_type')->nullable()->comment('特殊类型 1 公开课（只有公开课需要确认收货） 2 在线课 3 教材');
			$table->string('course_zhengshu')->nullable()->comment('课程证书');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('bbc_order');
	}

}
