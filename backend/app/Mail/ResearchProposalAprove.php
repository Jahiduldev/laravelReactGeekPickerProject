<?php

namespace App\Mail;

use App\Models\ResearchProposal;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ResearchProposalAprove extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public $researchProposal;
    public function __construct(ResearchProposal $researchProposal)
    {
        $this->researchProposal = $researchProposal;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject("Research Proposal Mail")->view("mailview.research_proposal_aprove");
    }
}
