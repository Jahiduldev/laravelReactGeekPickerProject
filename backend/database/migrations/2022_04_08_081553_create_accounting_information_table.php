<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAccountingInformationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('accountingInformations', function (Blueprint $table) {
            $table->id();
            $table->string('coid');
            $table->string('AccountType');
            $table->string('ChartOfAccountNo');
            $table->string('Amount');
            $table->string('DrOrCr');
            $table->string('FiscalYear');
            $table->string('CurrecnyId');
            $table->string('TransactionInformationId');
            $table->date('CreatedBy');
            $table->date('ModifiedDate');
            $table->date('ModifiedBy');
            $table->string('IsActive')->default(0);
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
        Schema::dropIfExists('accountingInformations');
    }
}

