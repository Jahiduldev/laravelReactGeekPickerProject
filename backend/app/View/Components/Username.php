<?php

namespace App\View\Components;

use Illuminate\View\Component;
use Illuminate\Support\Facades\Auth;

class Username extends Component
{
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {    $user = Auth::user();
         if($user==null){
          return view('components.username',[
                         'userName' =>  'Guest'

                         ]);
         } else{
              $userName= $user->name;

                 return view('components.username',[
                 'userName' =>  $userName

                 ]);
         }

    }
}
