<?php

use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\ProfileController;
use Illuminate\Support\Facades\Route;


Route::prefix("admin")->name("user.")->group(function(){

    Route::controller(DashboardController::class)->group(function(){
        Route::get('dashboard','index')->name('dashboard');
    });

    //profile
    Route::controller(ProfileController::class)->prefix("profile")->name("profile.")->group(function(){
        Route::get('/','index')->name('index');
    });

});


