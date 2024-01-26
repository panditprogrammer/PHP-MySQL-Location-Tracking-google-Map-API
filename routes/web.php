<?php

use App\Http\Controllers\SiteController;
use Illuminate\Support\Facades\Route;

// FrontEnd
Route::controller(SiteController::class)->group(function () {
    Route::get('/', 'index')->name('index');
});
