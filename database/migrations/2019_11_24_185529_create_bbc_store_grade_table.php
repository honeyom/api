<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateBbcStoreGradeTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('bbc_store_grade', function(Blueprint $table)
		{
			$table->increments('sg_id')->comment('索引ID');
			$table->char('sg_name', 50)->nullable()->comment('等级名称');
			$table->integer('sg_goods_limit')->unsigned()->default(0)->comment('允许发布的商品数量');
			$table->integer('sg_album_limit')->unsigned()->default(0)->comment('允许上传图片数量');
			$table->integer('sg_space_limit')->unsigned()->default(0)->comment('上传空间大小，单位MB');
			$table->boolean('sg_template_number')->default(0)->comment('选择店铺模板套数');
			$table->string('sg_template')->nullable()->comment('模板内容');
			$table->string('sg_price', 100)->nullable()->comment('费用');
			$table->boolean('sg_confirm')->default(1)->comment('审核，0为否，1为是，默认为1');
			$table->text('sg_description', 65535)->nullable()->comment('申请说明');
			$table->string('sg_function')->nullable()->comment('附加功能');
			$table->boolean('sg_sort')->default(0)->comment('级别，数目越大级别越高');
			$table->boolean('sld_is_supplier')->default(0)->comment('是否为供货商');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('bbc_store_grade');
	}

}
