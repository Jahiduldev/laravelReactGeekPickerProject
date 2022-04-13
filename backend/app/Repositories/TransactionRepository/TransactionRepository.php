<?php

namespace App\Repositories\TransactionRepository;

use App\Models\Transaction_information;
use App\Repositories\TransactionRepository\ITransactionRepository;
use App\Models\User;
use http\Env\Request;
use Illuminate\Support\Facades\DB;


class TransactionRepository implements ITransactionRepository
{


    public function __construct()
    {

    }

    //get currentcy rate user fixer api if limim 100 cross it will  show error in trail version
    public static function currencyEcchange($currencyAmount, $CurrencyCode, $receiverCurrencyType)
    {
        if (empty($currencyAmount) || is_null($CurrencyCode) || is_null($receiverCurrencyType)) {
            return response()->json(['message' => 'currency Ecchange failed']);

        }
        //get exchange data from fixer api
        $client = new \GuzzleHttp\Client();
        $response = $client->request('GET', 'http://data.fixer.io/api/latest?access_key=5a8e988f7f0da4bbb20d98c0810e5f79')->getBody();

        $getPHParrayFromJson = json_decode($response);


        $oneEuro = $getPHParrayFromJson->rates->USD;  // 1 uro equal to usd
        $oneUSD = 0.92; // 1 usd equal to ur // can not able to get this rate via api due to api restriction

        if ($CurrencyCode == 1) {
            return $TotalUSDFromEuro = $oneEuro * $currencyAmount;
        } else {

            return $TotalEuroAmount = $oneUSD * $currencyAmount;
        }

    }

    //get currentcy type of receiver account by account number
    public static function checkAccoutForCurrency($customerReceiverAccNo)
    {
        if (empty($customerReceiverAccNo)) {

            return response()->json(['message' => 'currency checking failed']);
        }
        return $getSenderUserCurrencyType = User::where('accountsNumber', '=', $customerReceiverAccNo)->first()->CurrencyCode;

        return response()->json(['message' => 'get sender user currency  checking failed']);
    }

    //get receiver user id by accounts number
    public static function getReceiverIdByAccoutsNo($customerReceiverAccNo)
    {
        if (empty($customerReceiverAccNo)) {

            return response()->json(['message' => 'get receiver user  checking failed']);
        }
        $getSenderUserCurrencyType = User::where('accountsNumber', '=', $customerReceiverAccNo)->first()->id;
        return $getSenderUserCurrencyType;
    }


    public function emoneyTransferTOCustomer($request)
    {

        // return response()->json(['message' => 'Transaction Successfully done']);
        $checkReceiveableCustomerHaveUsdOrEuroBalance = self::checkAccoutForCurrency($request->customerReceiverAccNo);

        //get Usd or Euro from api conversion as per customer currency type . if customer have euro , then receive euro and
        // if customer have usd then receive usd
        $totalDollarOrEuro = self::currencyEcchange((int)$request->amount, $request->CurrencyCode, $checkReceiveableCustomerHaveUsdOrEuroBalance);

        //receiver account number
        $receiverId = self::getReceiverIdByAccoutsNo($request->customerReceiverAccNo);

        //Uniquer transacion number for transaction
        $TransactionNosubstr = uniqid();;

        //if below value if empty , no tranasction will be made
        if (empty($request->customerSenderId) || empty($request->amount) || empty($request->customerSenderAccNo) || empty($request->customerReceiverAccNo) || is_null($request->CurrencyCode)) {

            return response()->json(['message' => 'emoney validation failed  failed']);
        }
        //if customer want to send balance to his own account , then will be blcoked
        if ($request->customerSenderId == $request->customerReceiverAccNo) {
            return response()->json(['message' => 'Please, This is your own account number']);
        }

        DB::beginTransaction();
        try {
            Transaction_information::create([
                'CustomerId' => $request->customerSenderId,
                'TransactionNo' => $TransactionNosubstr,
                'TransactionTypeId' => 1,
                'TransactionTypeName' => 'debit',
                'Amount' => $totalDollarOrEuro,
                'FromAccount' => $request->customerSenderAccNo,
                'ToAccount' => $request->customerReceiverAccNo,
                'CurrencyCode' => $request->CurrencyCode,
                'ReceivedDate' => date("Y-m-d"),
                'Remarks' => 'remarks',
                'ModifiedDate' => date("Y-m-d"),
                'IsActive' => '1'
            ]);

            Transaction_information::create([
                'CustomerId' => $receiverId,
                'TransactionNo' => $TransactionNosubstr,
                'TransactionTypeId' => 0,
                'TransactionTypeName' => 'credit',
                'Amount' => $totalDollarOrEuro,
                'FromAccount' => $request->customerSenderAccNo,
                'ToAccount' => $request->customerReceiverAccNo,
                'CurrencyCode' => $checkReceiveableCustomerHaveUsdOrEuroBalance,
                'ReceivedDate' => date("Y-m-d"),
                'Remarks' => 'remarks',
                'ModifiedDate' => date("Y-m-d"),
                'IsActive' => '1'
            ]);

            DB::commit();
            // all good
        } catch (\Exception $e) {
            DB::rollback();
            // something went wrong
            echo $e;
        }
        // $id = 2;
        echo 'Transaction Successfully done';
        //DB::statement('call UpdatePersonProfileTable(?, ?)', [$id, $request->amount]);
        return response()->json(['message' => 'Transaction Successfully done']);
    }


}
