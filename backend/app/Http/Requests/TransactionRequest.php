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
            //
            'Narration'  => 'required',
            'Coaid' =>  'required',
            'AccountType' => 'required|confirmed'
            'ChartOfAccountNo'  => 'required',
            'Amount' =>  'required',
            'DrOrCr' => 'required|confirmed'
            'FiscalYear'  => 'required',
            'CurrecnyId' =>  'required',
            'Remarks' => 'required|confirmed'
            'TransactionInformationId'  => 'required'
            
        ];
    }
}

