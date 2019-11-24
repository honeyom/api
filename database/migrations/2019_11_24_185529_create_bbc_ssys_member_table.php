<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateBbcSsysMemberTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('bbc_ssys_member', function(Blueprint $table)
		{
			$table->integer('member_id', true)->comment('会员id');
			$table->string('member_name', 50)->index('member_name')->comment('会员名称');
			$table->string('member_truename', 20)->nullable()->comment('真实姓名');
			$table->string('member_avatar', 50)->nullable()->comment('会员头像');
			$table->boolean('member_sex')->nullable()->comment('会员性别');
			$table->date('member_birthday')->nullable()->comment('生日');
			$table->string('member_passwd', 32)->comment('会员密码');
			$table->char('member_paypwd', 32)->nullable()->comment('支付密码');
			$table->string('member_email', 100)->comment('会员邮箱');
			$table->boolean('member_email_bind')->nullable()->default(0)->comment('0未绑定1已绑定');
			$table->string('member_mobile', 11)->nullable()->default('')->comment('手机号');
			$table->boolean('member_mobile_bind')->nullable()->default(0)->comment('0未绑定1已绑定');
			$table->string('member_qq', 100)->nullable()->comment('qq');
			$table->string('member_ww', 100)->nullable()->comment('阿里旺旺');
			$table->integer('member_login_num')->default(1)->comment('登录次数');
			$table->string('member_time', 10)->comment('会员注册时间');
			$table->string('member_login_time', 10)->comment('当前登录时间');
			$table->string('member_old_login_time', 10)->comment('上次登录时间');
			$table->string('member_login_ip', 20)->nullable()->comment('当前登录ip');
			$table->string('member_old_login_ip', 20)->nullable()->comment('上次登录ip');
			$table->string('member_qqopenid', 100)->nullable()->comment('qq互联id');
			$table->text('member_qqinfo', 65535)->nullable()->comment('qq账号相关信息');
			$table->string('member_sinaopenid', 100)->nullable()->comment('新浪微博登录id');
			$table->text('member_sinainfo', 65535)->nullable()->comment('新浪账号相关信息序列化值');
			$table->string('weixin_unionid', 50)->nullable()->comment('微信用户统一标识');
			$table->string('weixin_info')->nullable()->comment('微信用户相关信息');
			$table->integer('member_points')->default(0)->comment('会员积分');
			$table->decimal('available_yongjin', 10)->unsigned()->nullable()->default(0.00)->comment('可用佣金');
			$table->decimal('freeze_yongjin', 10)->unsigned()->nullable()->default(0.00)->comment('未结算佣金');
			$table->decimal('disable_yongjin', 10)->unsigned()->nullable()->default(0.00)->comment('失效佣金');
			$table->boolean('is_buy')->default(1)->comment('会员是否有购买权限 1为开启 0为关闭');
			$table->boolean('is_allowtalk')->default(1)->comment('会员是否有咨询和发送站内信的权限 1为开启 0为关闭');
			$table->boolean('member_state')->default(1)->comment('会员的开启状态 1为开启 0为关闭');
			$table->integer('member_areaid')->nullable()->comment('地区ID');
			$table->integer('member_cityid')->nullable()->comment('城市ID');
			$table->integer('member_provinceid')->nullable()->comment('省份ID');
			$table->string('member_areainfo')->nullable()->comment('地区内容');
			$table->text('member_privacy', 65535)->nullable()->comment('隐私设定');
			$table->integer('member_growthvalue')->default(0)->comment('会员经验值');
			$table->integer('parent3_id')->nullable()->comment('三级上线ID');
			$table->integer('parent2_id')->nullable()->comment('二级上线ID');
			$table->integer('parent_id')->unsigned()->nullable()->comment('邀请人ID');
			$table->string('wx_openid', 100)->nullable()->comment('微信openid（现在用于小程序）');
			$table->string('wx_nickname', 64)->nullable()->comment('微信昵称');
			$table->string('wx_area', 128)->nullable()->comment('微信的地区 省+空格+市');
			$table->integer('shop_member_id')->nullable()->comment('关联的商城用户ID');
			$table->boolean('ts_member_state')->nullable()->default(0)->comment('推手的状态: 0:不是推手(新用户) 1:还未成为推手(具备推手的条件,但还未达成) 2真正的推手');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('bbc_ssys_member');
	}

}
