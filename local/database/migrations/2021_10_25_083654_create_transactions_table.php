<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->integer('client_id');
            $table->integer('user_id');
            $table->decimal('value');
            $table->string('type');
            $table->text('notes');
            $table->dateTime('duedate');
            $table->integer('status');
            $table->integer('project_id');
            $table->integer('contract_id');
            $table->integer('po_id');
            $table->integer('store_id');
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
        Schema::dropIfExists('transactions');
    }
}
