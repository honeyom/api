<?php

namespace App\Http\Requests\Api;

use Illuminate\Foundation\Http\FormRequest;

class ReceiptRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'member_id'=>'required',
            'inv_state'=>'',
            'inv_title'=>'required',
            'inv_content'=>'required',
            'inv_company'=>'required',
            'inv_code'=>'required',
            'inv_reg_baccount'=>'required',
            'inv_rec_name'=>'required',
            'inv_rec_mobphone'=>'required',
            'inv_goto_addr'=>'required',
        ];
    }
    public function messages()
    {
        return [
            'member_id'=>'会员id',
            'inv_state'=>'1普通发票2增值税发票',
            'inv_title'=>'发票抬头',
            'inv_content'=>'发票内容',
            'inv_company'=>'发票公司',
            'inv_code'=>'纳税人识别号',
            'inv_reg_baccount'=>'银行帐户',
            'inv_rec_name'=>'收票人姓名',
            'inv_rec_mobphone'=>'收票人手机号',
            'inv_goto_addr'=>'送票地址',
        ];
    }
}
