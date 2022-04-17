<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ReportingController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::group([

    'middleware' => 'api',
    'namespace' => 'App\Http\Controllers',
], function ($router) {

    Route::post('signup', 'AuthController@signup');
    Route::post('login', 'AuthController@login');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');
    Route::post('sendPasswordResetLink', 'ResetPasswordController@sendEmail');
    Route::post('resetPassword', 'ChangePasswordController@process');
    Route::post('sendToCustomer', 'TransactionController@sendToCustomer');
    Route::get('userDataById', 'AuthController@userInfo');

});


Route::group([
    'middleware' => ['api'],
    'namespace' => 'App\Http\Controllers',
], function ($router) {
    Route::get('transactionReport', [\App\Http\Controllers\ReportingController::class,'transactionReport']);
    Route::get('totalAmountOFConversion', [\App\Http\Controllers\ReportingController::class,'totalAmountOFConversionForParticularUser']);
});





