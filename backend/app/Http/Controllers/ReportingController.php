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
}
