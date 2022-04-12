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

    public static function currencyEcchange($currencyAmount, $currencyType, $receiverCurrencyType)
    {

        $client = new \GuzzleHttp\Client();
        $response = $client->request('GET', 'http://data.fixer.io/api/latest?access_key=5a8e988f7f0da4bbb20d98c0810e5f79')->getBody();

        $getPHParrayFromJson = json_decode($response);

        $oneEuro = $getPHParrayFromJson->rates->USD;  // 1 uro equal to usd
        $oneUSD = 0.92; // 1 usd equal to ur // can not able to get this rate via api due to api restriction

        if ($currencyType == 1) {
            return $TotalUSDFromEuro = $oneEuro * $currencyAmount;
        } else {
            return $TotalEuroAmount = $oneUSD * $currencyAmount;
        }
    }

    public static function checkAccoutForCurrency($customerReceiverAccNo)
    {
        $getSenderUserCurrencyType = User::where('accountsNumber', '=', $customerReceiverAccNo)->first()->CurrencyType;
        return $getSenderUserCurrencyType;
    }

    public function emoneyTransferTOCustomer($request)
    {
        $checkReceiveableCustomerHaveUsdOrEuroBalance = self::checkAccoutForCurrency($request->customerReceiverAccNo);
        //get Usd or Euro from api conversion as per customer currency type . if customer have euro , then receive euro and
        // if customer have usd then receive usd
        $totalDollarOrEuro = self::currencyEcchange($request->amount, $request->currencyType, $checkReceiveableCustomerHaveUsdOrEuroBalance);


        DB::beginTransaction();
        try {
            Transaction_information::create([
                'CustomerId' => $request->customerSenderId,
                'TransactionNo' => '532123fdafad',
                'TransactionTypeId' => 1,
                'TransactionTypeName' => 'debit',
                'Amount' => $totalDollarOrEuro,
                'UserName' => $request->name,
                'FromAccount' => $request->customerSenderAccNo,
                'ToAccount' => $request->customerReceiverAccNo,
                'CurrencyCode' => 'currnectycode',
                'ReceivedDate' => date("Y-m-d"),
                'Remarks' => 'remarks',
                'ReceiverCustomerId' => 465456,
                'CreatedBy' => 'shamim',
                'CreatedDate' => date("Y-m-d"),
                'ModifiedBy' => 'shamim',
                'IsActive' => '1',
                'ModifiedDate' => date("Y-m-d")
            ]);

            Transaction_information::create([
                'CustomerId' => '1234',
                'TransactionNo' => '5321h23fdafad',
                'TransactionTypeId' => 2,
                'TransactionTypeName' => 'credit',
                'Amount' => $totalDollarOrEuro,
                'UserName' => $request->name,
                'FromAccount' => $request->customerSenderAccNo,
                'ToAccount' => $request->customerReceiverAccNo,
                'CurrencyCode' => '$request->currencyType',
                'ReceivedDate' => date("Y-m-d"),
                'Remarks' => 'remarks',
                'ReceiverCustomerId' => 5455,
                'CreatedBy' => 'shamim',
                'CreatedDate' => date("Y-m-d"),
                'ModifiedBy' => 'shamim',
                'IsActive' => '1',
                'ModifiedDate' => date("Y-m-d"),
            ]);

            DB::commit();
            // all good
        } catch (\Exception $e) {
            DB::rollback();
            // something went wrong
            echo $e;
        }
        $id = 2;

        DB::statement('call UpdatePersonProfileTable(?, ?)', [$id, $request->amount]);
        return response()->json(['message' => 'Transaction Successfully done']);
    }




}
