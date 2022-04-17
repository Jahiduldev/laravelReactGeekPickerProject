<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaction_information extends Model
{
    use HasFactory;

    protected $fillable = [
        'CustomerId',
        'TransactionNo',
        'TransactionType',
        'TransactionTypeName',
        'Amount',
        'FromAccount',
        'ToAccount',
        'CurrencyCode',
        'ReceivedDate',
        'Remarks',
        'IsActive',
        'ModifiedDate'
    ];


    public function user(){
        return $this->belongsTo('App\User');
    }

}


