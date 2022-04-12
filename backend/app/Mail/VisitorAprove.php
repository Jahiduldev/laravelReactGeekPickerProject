<?php

namespace App\Mail;

use App\Models\Visitor;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Models\VisitorHistory;

class VisitorAprove extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public $visitorHistory;
    public function __construct(VisitorHistory $visitorHistory)
    {
        $this->visitorHistory = $visitorHistory;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject("Visitor Aprove Mail")->view("mailview.visitor_aprove");
    }
}
