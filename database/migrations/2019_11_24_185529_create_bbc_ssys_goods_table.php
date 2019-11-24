<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateBbcSsysGoodsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('bbc_ssys_goods', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('gid')->comment('商城系统gid');
			$table->integer('goods_commonid')->comment('商城系统goods_commonid');
			$table->integer('cate_id')->nullable()->default(0)->comment('商城系统商品分类ID');
			$table->string('from_flag', 30)->default('')->comment('商城系统来源标示');
			$table->float('yj_amount', 10)->default(0.00)->comment('设置的奖励金额');
			$table->text('share_link', 65535)->nullable()->comment('商城系统用于分享的url');
			$table->integer('add_time')->comment('添加时间');
			$table->integer('update_time')->comment('更新时间');
			$table->boolean('is_buy_condition')->default(0)->comment('是否是成为推手的购买条件商品 1是 0否');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('bbc_ssys_goods');
	}

}
