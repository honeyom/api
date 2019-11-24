<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateVendorDocTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('vendor_doc', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('doc_id')->nullable()->comment('文档合同id');
			$table->integer('member_id')->nullable()->comment('入住的商家的id');
			$table->string('process')->nullable()->comment('同步状态 1,正在同步,2 同步完成,3其他异常');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('vendor_doc');
	}

}
