<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateBbcSsysYjLogTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('bbc_ssys_yj_log', function(Blueprint $table)
		{
			$table->integer('lg_id', true)->comment('自增编号');
			$table->integer('lg_member_id')->comment('会员编号');
			$table->string('lg_member_name', 50)->comment('会员名称');
			$table->string('lg_admin_name', 50)->nullable()->comment('管理员名称');
			$table->string('lg_type', 15)->default('')->comment('order_pay获得冻结金额,order_cancel取消订单扣除冻结金额增加失效,refund退款退货扣除冻结金额增加失效金额,order_over订单完结冻结金额转为可用金额,cash_apply提现申请可用转冻结,cash_over申请提现通过扣除可用,cash_refuse申请提现拒绝回退可用,cash_del取消申请提现回退可用');
			$table->decimal('lg_av_amount', 10)->default(0.00)->comment('可用金额变更0表示未变更');
			$table->decimal('lg_freeze_amount', 10)->default(0.00)->comment('冻结金额变更0表示未变更');
			$table->decimal('lg_disable_amount', 10)->default(0.00)->comment('失效金额变更0表示未变更');
			$table->integer('lg_add_time')->comment('添加时间');
			$table->string('lg_desc', 150)->nullable()->comment('描述');
			$table->string('process')->nullable()->comment('同步1正在同步,2同步完成,3同步失败,其他状态');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('bbc_ssys_yj_log');
	}

}
