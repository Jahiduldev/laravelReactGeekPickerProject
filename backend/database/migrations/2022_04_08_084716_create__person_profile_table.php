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
            $table->string('PersonAcNo');
            $table->string('PersonContactNo');
            $table->string('AreMarried');
            $table->string('PersonNidNo');
            $table->string('PersonNidUrl');
            $table->string('PersonTinNo');
            $table->string('PersonFatherName');
            $table->string('PersonMotherName');
            $table->string('PersonHusbandName');
            $table->string('PersonWifeName');
            $table->string('CurrentUtcTimeZone');
            $table->string('PersonImgUrl');
            $table->string('CommissionId');
            $table->string('PersonGender');
            $table->string('DegreeId');
            $table->text('PersonPermanentAddress');
            $table->string('PersonPresentAddress');
            $table->string('BussinessName');
            $table->string('BussinessAddress');
            $table->string('Area');
            $table->string('SalesZone');
            $table->string('TradeLicenseNo');
            $table->string('TradeLicenseUrl');
            $table->string('TaxStatusId');
            $table->string('OutletName');
            $table->string('OutletAddress');
            $table->string('OutletImgUrl');
            $table->string('BussinessDocUrl');
            $table->string('BankId');
            $table->string('BankAccountNo');
            $table->string('BankBranchId');
            $table->string('BankAccountType');
            $table->string('BankRoutingNumber');
            $table->string('BusinessTypeId');
            $table->string('BusinessSubTypeId');
            $table->string('RevisionNum');
            $table->string('IsApproved');
            $table->string('Comment');
            $table->string('UserTypeId');
            $table->string('UserStatusId');
            $table->string('CurrentBalance');
            $table->string('DailyTransactionLimit');
            $table->string('DailyTransactionLimitAmt');
            $table->string('MonthlyTransactionLimit');
            $table->string('MonthlyTransactionLimitAmt');
            $table->string('TodayNumberOfTransaction');
            $table->string('TodayTotalTransactionAmount');
            $table->string('CurrentMonthNumberOfTransaction');
            $table->string('CurrentMonthTotalTransactionAmount');
            $table->string('LastTransactionDate');
            $table->string('AreaId');
            $table->string('CreatedDate');
            $table->string('CreatedBy');
            $table->string('ModifiedDate');
            $table->string('ModifiedBy');
            $table->string('IsActive');
            $table->string('IsDeleted');
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
