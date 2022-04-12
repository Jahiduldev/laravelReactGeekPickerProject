<?php

namespace App\Providers;
use Illuminate\Support\ServiceProvider;

class RepositoriesServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
    //
        $this->app->bind(
            'App\Repositories\TransactionRepository\ITransactionRepository',
            'App\Repositories\TransactionRepository\TransactionRepository'
        );
    }
   
    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
       
    }
}
