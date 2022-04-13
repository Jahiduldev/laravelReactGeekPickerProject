<?php

namespace App\Repositories\TransactionRepository;
interface ITransactionRepository
{
    //customer send money using accounts number and change rate using fixer api
    public function emoneyTransferTOCustomer($request);

}
