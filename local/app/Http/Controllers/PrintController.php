<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Mike42\Escpos\Printer;
use Mike42\Escpos\EscposImage;
use Mike42\Escpos\CapabilityProfile;
use Mike42\Escpos\PrintConnectors\FilePrintConnector;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;
use Mike42\Escpos\PrintConnectors\NetworkPrintConnector;
class PrintController extends Controller
{
   public $printer;
   public $char_per_line = 42;
  public function index(){
      $connector = new FilePrintConnector("BIXOLON SRP-F310");
      $printer = new Printer($connector);
      /*if ($printer->connection_type == 'network') {
          set_time_limit(30);
          $connector = new NetworkPrintConnector($printer->ip_address, $printer->port);
      } elseif ($printer->connection_type == 'linux') {
          $connector = new FilePrintConnector($printer->path);
      } else {
          $connector = new WindowsPrintConnector($printer->path);
      }*/
      dd($connector);
      $connector = new WindowsPrintConnector($printer->path);
      $this->char_per_line = $printer->char_per_line;

      $profile = CapabilityProfile::load($printer->capability_profile);
      $this->printer = new Printer($connector, $profile);
      return 'this printe ';
  }
}
