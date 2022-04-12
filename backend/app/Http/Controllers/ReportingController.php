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
        $posts = DB::table('transaction_informations')->get();
        return $posts;
    }


    public function thridHishestTransactionForParticularUser()
    {
        $posts = DB::table('transaction_informations')->get();
        return $posts;
    }
}
