<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateBbcInvoiceTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('bbc_invoice', function(Blueprint $table)
		{
			$table->integer('inv_id', true)->comment('索引id');
			$table->integer('member_id')->unsigned()->comment('会员ID');
			$table->enum('inv_state', array('1','2'))->nullable()->comment('1普通发票2增值税发票');
			$table->string('inv_title', 50)->nullable()->default('')->comment('发票抬头[普通发票]');
			$table->string('inv_content', 10)->nullable()->default('')->comment('发票内容[普通发票]');
			$table->string('inv_company', 50)->nullable()->default('')->comment('单位名称');
			$table->string('inv_code', 50)->nullable()->default('')->comment('纳税人识别号');
			$table->string('inv_reg_addr', 50)->nullable()->default('')->comment('注册地址');
			$table->string('inv_reg_phone', 30)->nullable()->default('')->comment('注册电话');
			$table->string('inv_reg_bname', 30)->nullable()->default('')->comment('开户银行');
			$table->string('inv_reg_baccount', 30)->nullable()->default('')->comment('银行帐户');
			$table->string('inv_rec_name', 20)->nullable()->default('')->comment('收票人姓名');
			$table->string('inv_rec_mobphone', 15)->nullable()->default('')->comment('收票人手机号');
			$table->string('inv_rec_province', 30)->nullable()->default('')->comment('收票人省份');
			$table->string('inv_goto_addr', 50)->nullable()->default('')->comment('送票地址');
			$table->string('process')->nullable()->comment('同步状态 1正在同步,2同步完成,3其他');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('bbc_invoice');
	}

}
