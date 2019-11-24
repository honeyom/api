<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateBbcDocumentTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('bbc_document', function(Blueprint $table)
		{
			$table->integer('doc_id', true)->comment('id');
			$table->string('doc_code')->unique('doc_code')->comment('调用标识码');
			$table->string('doc_title')->comment('标题');
			$table->text('doc_content', 65535)->comment('内容');
			$table->integer('doc_time')->unsigned()->comment('添加时间/修改时间');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('bbc_document');
	}

}
