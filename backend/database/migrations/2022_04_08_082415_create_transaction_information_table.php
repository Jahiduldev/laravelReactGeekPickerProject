<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransactionInformationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transaction_informations', function (Blueprint $table) {
            $table->id();
            $table->string('CustomerId');
            $table->string('TransactionNo');
            $table->string('TransactionTypeId');
            $table->string('TransactionTypeName');
            //$table->string('TransactionStatusId');
            //$table->string('TransactionStatus');
            $table->bigInteger('Amount');
            $table->string('UserName');
            $table->string('FromAccount');
            //$table->integer('FromAccountType');
            $table->string('ToAccount');
            //$table->string('ToAccountType');
            $table->string('CurrencyCode');
            $table->integer('ReceivedAmount');
            $table->date('ReceivedDate');
            $table->text('Remarks');
            $table->string('ReceiverCustomerId');
            //$table->string('TransactionSuccessfulDate');
            //$table->string('ReversalTransactionId');
            //$table->string('TransactionError');
            $table->date('CreatedDate');
            $table->string('CreatedBy')->default(null);
            $table->date('ModifiedDate');
            $table->string('ModifiedBy')->default(null);
            $table->string('IsActive')->default(null);
            $table->string('IsDeleted')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transaction_information');
    }
}

