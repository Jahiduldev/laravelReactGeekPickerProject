<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use  App\Models\Transaction_information;
use  Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class ReportingController extends Controller
{
    //
    public function transactionReport()
    {
        $posts = DB::table('transaction_informations')->where('CustomerId','=',1)->get();
        return $posts;
    }


    public function userWhoUsedMostConversion()
    {
        $posts = DB::table('transaction_informations')->get();
        return $posts;
    }


    public function totalAmountOFConversionForParticularUser()
    {

        $A = [];
        $B = [];

        $posts = DB::table('transaction_informations')->where('TransactionTypeId', '=', 1)->get();
        foreach ($posts as $data) {

            //$CustomerId = $data->CustomerId;
            $CustomerId = $data->FromAccount;
            $Amount = $data->Amount;

            if (isset($A[$CustomerId])) {
                $A[$CustomerId] = $A[$CustomerId] + $Amount;
            } else {
                $A[$CustomerId] = $Amount;
                array_push($B, $CustomerId);
            }
        }

        return empty($A) ? [] : $A;

    }



    public function thridHishestTransactionForParticularUser()
    {
        echo 'total';

    }
}
