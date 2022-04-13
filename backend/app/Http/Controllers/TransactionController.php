<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Repositories\TransactionRepository\ITransactionRepository;
use Illuminate\Http\Request;
use App\Http\Requests\EmoneySendRequest;
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
    /*
     * Jahidul isalm
     *
     * customer send money from one account to another
     * */
    public function sendToCustomer(EmoneySendRequest $request)
    {
        //if this validation pass then it will go for next request
        //Note: we can use the above validation or rules ( time short)

        $this->service->emoneyTransferTOCustomer($request);
    }

}

