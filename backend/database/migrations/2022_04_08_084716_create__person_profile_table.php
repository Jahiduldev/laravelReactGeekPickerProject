<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePersonProfileTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('personal_profiles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('profile_Id');
            $table->string('accountNumber')->nullable();
            $table->decimal('totalAmount',20,5)->nullable();
            $table->integer('currencyType')->nullable()->comment('Must be set before transaction');
            $table->string('PersonContactNo')->nullable();
            $table->string('PersonNidNo')->nullable();
            $table->string('PersonTinNo')->nullable();;
            $table->string('PersonFatherName')->nullable();
            $table->string('PersonMotherName')->nullable();
            $table->string('PersonHusbandName')->nullable();
            $table->string('PersonWifeName')->nullable();
            $table->date('CurrentUtcTimeZone')->nullable();
            $table->text('PersonPermanentAddress')->nullable();
            $table->string('PersonPresentAddress')->nullable();
            $table->string('TradeLicenseNo')->nullable();
            $table->tinyInteger('TaxStatusId')->nullable();
            $table->bigInteger('DailyTransactionLimit')->default(0);
            $table->bigInteger('DailyTransactionLimitAmt')->default(0);
            $table->bigInteger('MonthlyTransactionLimit')->default(0);
            $table->bigInteger('MonthlyTransactionLimitAmt')->default(0);
            $table->bigInteger('TotalNumberOfTransaction')->default(0);
            $table->bigInteger('TotalTotalTransactionAmount')->default(0);
            $table->integer('CurrentMonthNumberOfTransaction');
            $table->string('LastTransactionDate')->nullable();
            $table->string('status')->default(1)->comment("1=active,0=blocked");
            $table->foreign('profile_Id')->references('id')->on('users');
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
        Schema::dropIfExists('personal_profiles');
    }
}
