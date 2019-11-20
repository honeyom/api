<?php

namespace App\Http\Requests\Api;

use Illuminate\Foundation\Http\FormRequest;

class VendorRequest extends FormRequest
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
        switch ($this->method()) {
            case 'GET':
                {
                    return [
                        'member_id' => ['required'],
                        'member_name'=>['required'],
                    ];
                }
            case 'POST':
                {
                    return [
                        'member_id' => ['required', 'max:12', 'unique:bbc_vendor_joinin,member_id'],
                        'member_name'=>['required'],
                    ];
                }
            case 'PUT':
            case 'PATCH':
            case 'DELETE':
            default:
                {
                    return [
                    ];
                }
        }
    }
    public function messages()
    {
        return [
            'member_id.required'=>'商家ID必须填写',
            'id.exists'=>'用户不存在',
            'name.unique' => '用户名已经存在',
            'member_id.max' => '商家id最大长度为12个字符',
            'member_name.required' => '商家用户名不能为空',
        ];
    }

}
