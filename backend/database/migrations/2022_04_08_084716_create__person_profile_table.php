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
        Schema::create('person_profile', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('profile_Id');
            $table->string('PersonAcNo');
            $table->string('PersonContactNo');
            $table->tinyInteger('AreMarried');
            $table->string('PersonNidNo');
            $table->string('PersonTinNo');
            $table->string('PersonFatherName');
            $table->string('PersonMotherName');
            $table->string('PersonHusbandName');
            $table->string('PersonWifeName');
            $table->date('CurrentUtcTimeZone');
            $table->string('PersonImgUrl');
            $table->integer('CommissionId');
            $table->tinyInteger('PersonGender');
            $table->integer('DegreeId');
            $table->text('PersonPermanentAddress');
            $table->string('PersonPresentAddress');
            $table->string('BussinessName');
            $table->string('BussinessAddress');
            $table->string('TradeLicenseNo');
            $table->string('TradeLicenseUrl');
            $table->tinyInteger('TaxStatusId');
            $table->string('BankId');
            $table->string('BankAccountNo');
            $table->string('BankBranchId');
            $table->string('BankAccountType');
            $table->string('BankRoutingNumber');
            $table->string('RevisionNum');
            $table->tinyInteger('IsApproved');
            $table->string('Comment');
            $table->integer('UserTypeId');
            $table->tinyInteger('UserStatusId');
            $table->bigInteger('DailyTransactionLimit');
            $table->bigInteger('DailyTransactionLimitAmt');
            $table->bigInteger('MonthlyTransactionLimit');
            $table->bigInteger('MonthlyTransactionLimitAmt');
            $table->bigInteger('TodayNumberOfTransaction');
            $table->bigInteger('TodayTotalTransactionAmount');
            $table->integer('CurrentMonthNumberOfTransaction');
            $table->string('LastTransactionDate');
            $table->string('ModifiedDate');
            $table->string('ModifiedBy');
            $table->string('IsActive');
            $table->string('IsDeleted');
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
        Schema::dropIfExists('_person_profile');
    }
}
