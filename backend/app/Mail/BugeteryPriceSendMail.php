<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Models\Vendor;
use App\Models\Vendor_master;
use Illuminate\Support\Facades\Storage;
use App\Models\Request_for_purchase;

class BugeteryPriceSendMail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    private $demandItems;
    private $vendorMasterId;
    private $vendorMaster;
    private $requestForPurchase;
    public $data;
    public function __construct($id)
    {
        $this->demandItems = Vendor::where('vendor_master_id', '=', $id)->get();
        $this->vendorMasterId = $id;
        $this->vendorMaster = Vendor_master::findOrFail($this->vendorMasterId);
        $this->requestForPurchase = Request_for_purchase::where('vendor_master_id', '=', $this->vendorMasterId)->firstOrFail();
        $this->data = "Purchase Approved";
    }


    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $file = storage_path('app/Aproved Demand' . $this->vendorMasterId . '.xlsx');
        return $this->subject("Purchase Aproved")->view("mailview.demand_aprove")->attach($file, ['as' => "Aproved Demand.xlsx"]);
    }
}
