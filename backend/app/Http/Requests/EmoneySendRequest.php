<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EmoneySendRequest extends FormRequest
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
            'customerSenderId' => 'required',
            'amount' => 'required',
            'customerSenderAccNo' => 'required',
            'customerReceiverAccNo' => 'required',
            'CurrencyCode' => 'required'
        ];
    }
}
