<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Models\Vendor;
use App\Exports\AproveDemandExport;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Storage;

class DemandAproveMail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    private $demandItems;
    private $vendorMasterId;
    public $data;
    public function __construct($id)
    {
        $this->demandItems = Vendor::where('vendor_master_id', '=', $id)->get();
        $this->vendorMasterId = $id;
        $this->data =  "Demand Approved";
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {

        $attachment = Excel::store(new AproveDemandExport($this->vendorMasterId), 'Aproved Demand' . $this->vendorMasterId . '.xlsx');
        // dd($attachment);
        $file = storage_path('app/Aproved Demand' . $this->vendorMasterId . '.xlsx');
        return $this->subject("Demand Approved")->view("mailview.demand_aprove")->attach($file, ['as' => "Aproved Demand.xlsx"]);
    }
}
