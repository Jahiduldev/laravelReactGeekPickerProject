<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use  App\Models\Transaction_information;
use  Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class ReportingController extends Controller
{
    //
    public function transactionReport()
    {
        $posts = DB::table('transaction_informations')->where('CustomerId', '=', 3)->get();
        return $posts;
    }


    public function userWhoUsedMostConversion()
    {
        $posts = DB::table('transaction_informations')->get();
        return $posts;
    }

    ///Userbased total transaction amount
    public function totalAmountOFConversionForParticularUser()
    {
        $getAccountNumberAndTransAmount = [];
        $B = [];

        $posts = DB::table('transaction_informations')->where('TransactionTypeId', '=', 1)->get();
        foreach ($posts as $data) {

            //$CustomerId = $data->CustomerId;
            $AccountNumber = $data->FromAccount;
            $Amount = $data->Amount;

            if (isset($A[$AccountNumber])) {
                $getAccountNumberAndTransAmount[$AccountNumber] = $getAccountNumberAndTransAmount[$AccountNumber] + $Amount;
            } else {
                $getAccountNumberAndTransAmount[$AccountNumber] = $Amount;
                array_push($B, $AccountNumber);
            }
        }

        return empty($getAccountNumberAndTransAmount) ? [] : $getAccountNumberAndTransAmount;

    }


    public function thridHishestTransactionForParticularUser()
    {
        echo 'total';

    }

}
