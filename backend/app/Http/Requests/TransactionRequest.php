<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TransactionRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
         return [
            'CustomerId'    => 'required',
            'Amount'        => 'required',
            'FromAccount'   => 'required',
            'ToAccount'     =>  'required',
            'CurrencyCode'  => 'required'
        ];
    }
}

