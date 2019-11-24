<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateUsersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('users', function(Blueprint $table)
		{
			$table->increments('id')->comment('主键ID');
			$table->string('name', 12)->comment('用户名称');
			$table->string('password', 80)->comment('密码');
			$table->text('last_token', 65535)->nullable()->comment('登陆时的token');
			$table->boolean('status')->default(0)->comment('用户状态 -1代表已删除 0代表正常 1代表冻结');
			$table->timestamps();
			$table->string('email')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('users');
	}

}
