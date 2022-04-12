<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use  App\Models\Transaction_information;
use  Illuminate\Support\Facades\DB;

class ReportingController extends Controller
{
    //
    public function transactionReport()
    {
        $posts = DB::table('transaction_informations')->get();
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

        $posts = DB::table('transaction_informations')->get();
        foreach ($posts as $data) {

            $CustomerId = $data->CustomerId;
           // $CustomerId = $data->UserName;
            $Amount = $data->Amount;

            if (isset($A[$CustomerId])) {
                $A[$CustomerId] = $A[$CustomerId] + $Amount;
            } else {
                $A[$CustomerId] = $Amount;
                array_push($B, $CustomerId);
            }
        }
        $output = [];

        echo '<pre>';
        print_r($A);
        echo '<hr>';
        print_r($B);


    }


    public function thridHishestTransactionForParticularUser()
    {
        echo 'total';

    }
}
