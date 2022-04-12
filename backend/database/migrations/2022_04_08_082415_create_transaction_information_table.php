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
            $table->unsignedBigInteger('CustomerId');
            $table->string('TransactionNo');
            $table->tinyInteger('TransactionTypeId')->comment('1=dabit, 0 = credit');
            $table->string('TransactionTypeName');
            $table->decimal('Amount', 20, 5);
            $table->string('FromAccount');
            $table->string('ToAccount');
            $table->tinyInteger('CurrencyCode');
            $table->date('ReceivedDate');
            $table->text('Remarks');
            $table->date('ModifiedDate');
            $table->string('IsActive')->default(null);
            $table->string('IsDeleted')->default(0);
            $table->foreign('CustomerId')->references('id')->on('users');
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

