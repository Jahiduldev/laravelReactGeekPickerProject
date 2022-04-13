<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('OTP')->nullable();
            $table->string('IsOTPVerify')->default(0);
            $table->tinyInteger('IsPasswordChanged')->default(0);
            $table->integer('accountsNumber')->default(0);
            $table->integer('CurrentBalance')->default(0);
            $table->tinyInteger('CurrencyCode')->default(0)->comment('1=Euro,0 = USD');
            $table->integer('PersonProfileId')->nullable();
            $table->tinyInteger('UserIsBlocked')->default(0);
            $table->tinyInteger('roleID')->default(0)->comment('1=admin,0 = user');;
            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
}


