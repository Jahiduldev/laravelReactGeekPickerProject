<?php

namespace App\Listeners;

use App\Events\SendMoney;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class AferSendCurrencyUpdate
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  \App\Events\SendMoney  $event
     * @return void
     */
    public function handle(SendMoney $event)
    {
        //
    }
}
