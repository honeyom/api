<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateBbcVendorJoininTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('bbc_vendor_joinin', function(Blueprint $table)
		{
			$table->integer('member_id')->unsigned()->primary()->comment('用户编号');
			$table->string('member_name', 50)->nullable()->comment('店主用户名');
			$table->string('company_name', 50)->nullable()->comment('公司名称');
			$table->integer('company_country_id')->nullable()->comment('所在国家id');
			$table->integer('company_province_id')->unsigned()->default(0)->comment('所在地省ID');
			$table->integer('company_city_id')->nullable()->default(0)->comment('所在城市id');
			$table->integer('company_area_id')->nullable()->default(0)->comment('所在地区id');
			$table->string('company_address', 50)->nullable()->comment('公司地址');
			$table->string('company_address_detail', 50)->nullable()->comment('公司详细地址');
			$table->string('company_phone', 20)->nullable()->comment('公司电话');
			$table->integer('company_employee_count')->unsigned()->nullable()->comment('员工总数');
			$table->integer('company_registered_capital')->unsigned()->nullable()->comment('注册资金');
			$table->string('contacts_name', 50)->nullable()->comment('联系人姓名');
			$table->string('contacts_phone', 20)->nullable()->comment('联系人电话');
			$table->string('contacts_email', 50)->nullable()->comment('联系人邮箱');
			$table->string('business_licence_number', 50)->nullable()->comment('营业执照号');
			$table->string('business_licence_address', 50)->nullable()->comment('营业执所在地');
			$table->date('business_licence_start')->nullable()->comment('营业执照有效期开始');
			$table->date('business_licence_end')->nullable()->comment('营业执照有效期结束');
			$table->string('business_sphere', 1000)->nullable()->comment('法定经营范围');
			$table->string('business_licence_number_electronic', 50)->nullable()->comment('营业执照电子版');
			$table->string('organization_code', 50)->nullable()->comment('组织机构代码');
			$table->string('organization_code_electronic', 50)->nullable()->comment('组织机构代码电子版');
			$table->string('general_taxpayer', 50)->nullable()->comment('一般纳税人证明');
			$table->string('bank_account_name', 50)->nullable()->comment('银行开户名');
			$table->string('bank_account_number', 50)->nullable()->comment('公司银行账号');
			$table->string('bank_name', 50)->nullable()->comment('开户银行支行名称');
			$table->string('bank_code', 50)->nullable()->comment('支行联行号');
			$table->string('bank_address', 50)->nullable()->comment('开户银行所在地');
			$table->string('bank_licence_electronic', 50)->nullable()->comment('开户银行许可证电子版');
			$table->boolean('is_settlement_account')->nullable()->comment('开户行账号是否为结算账号 1-开户行就是结算账号 2-独立的计算账号');
			$table->string('settlement_bank_account_name', 50)->nullable()->comment('结算银行开户名');
			$table->string('settlement_bank_account_number', 50)->nullable()->comment('结算公司银行账号');
			$table->string('settlement_bank_name', 50)->nullable()->comment('结算开户银行支行名称');
			$table->string('settlement_bank_code', 50)->nullable()->comment('结算支行联行号');
			$table->string('settlement_bank_address', 50)->nullable()->comment('结算开户银行所在地');
			$table->string('tax_registration_certificate', 50)->nullable()->comment('税务登记证号');
			$table->string('taxpayer_id', 50)->nullable()->comment('纳税人识别号');
			$table->string('tax_registration_certificate_electronic', 50)->nullable()->comment('税务登记证号电子版');
			$table->string('seller_name', 50)->nullable()->comment('卖家帐号');
			$table->string('store_name', 50)->nullable()->comment('店铺名称');
			$table->string('store_class_ids', 1000)->nullable()->comment('店铺分类编号集合');
			$table->string('store_class_names', 1000)->nullable()->comment('店铺分类名称集合');
			$table->string('joinin_state', 50)->nullable()->comment('申请状态 10-已提交申请 11-缴费完成  20-审核成功 30-审核失败 31-缴费审核失败 40-审核通过开店');
			$table->string('joinin_message', 200)->nullable()->comment('管理员审核信息');
			$table->boolean('joinin_year')->default(1)->comment('开店时长(年)');
			$table->string('sg_name')->nullable()->comment('店铺等级名称');
			$table->string('sg_id')->nullable()->comment('店铺等级编号');
			$table->string('sg_info', 200)->nullable()->comment('店铺等级下的收费等信息');
			$table->string('sc_name')->nullable()->comment('店铺分类名称');
			$table->string('sc_id')->nullable()->comment('店铺分类编号');
			$table->integer('sc_bail')->unsigned()->default(0)->comment('店铺分类保证金');
			$table->string('store_class_commis_rates', 200)->nullable()->comment('分类佣金比例');
			$table->string('paying_money_certificate', 50)->nullable()->comment('付款凭证');
			$table->string('paying_money_certificate_explain', 200)->nullable()->comment('付款凭证说明');
			$table->decimal('paying_amount', 10)->unsigned()->default(0.00)->comment('付款金额');
			$table->boolean('sld_is_supplier')->default(0)->comment('是否为供货商');
			$table->date('legal_licence_start')->nullable()->comment('法人证件有效期开始');
			$table->date('legal_licence_end')->nullable()->comment('法人证件有效期结束');
			$table->string('legal_licence_zheng_electronic', 50)->nullable()->comment('法人证件正面电子版');
			$table->string('legal_licence_fan_electronic', 50)->nullable()->comment('法人证件反面电子版');
			$table->string('legal_person_name', 50)->nullable()->comment('法人姓名');
			$table->string('legal_licence_number', 50)->nullable()->comment('法人身份证号');
			$table->string('vendor_add_img1', 50)->nullable()->comment('补充认证图片1');
			$table->string('vendor_add_img2', 50)->nullable()->comment('补充认证图片2');
			$table->string('vendor_add_img3', 50)->nullable()->comment('补充认证图片3');
			$table->integer('joinin_step')->default(1)->comment('申请进度');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('bbc_vendor_joinin');
	}

}
