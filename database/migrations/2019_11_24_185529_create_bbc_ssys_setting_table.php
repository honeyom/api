<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateBbcSsysSettingTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('bbc_ssys_setting', function(Blueprint $table)
		{
			$table->string('name', 50)->primary()->comment('名称');
			$table->text('value', 65535)->nullable()->comment('值');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('bbc_ssys_setting');
	}

}
