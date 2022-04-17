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
            $table->tinyInteger('TransactionType')->comment('1=dabit, 0 = credit');
            $table->string('TransactionTypeName');
            $table->decimal('Amount', 20, 5);
            $table->string('FromAccount');
            $table->string('ToAccount');
            $table->tinyInteger('CurrencyCode');
            $table->string('status')->default(0)->comment('1=active,0=pending');
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

