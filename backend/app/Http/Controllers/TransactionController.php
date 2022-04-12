<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Repositories\TransactionRepository\ITransactionRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\Transaction_information;
use Illuminate\Support\Facades\Http;
use GuzzleHttp\Client;

class TransactionController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    private $service;
    public function __construct(ITransactionRepository $service)
    {
        $this->service = $service;
    }
    public function index()
    {
    }
    public function sendToCustomer(Request $request)
    {
        $this->service->emoneyTransferTOCustomer($request);
    }

}

