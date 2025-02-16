<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CustomeAuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ChatController;


Route::post('/register', [CustomeAuthController::class, 'register']);
Route::post('/login', [CustomeAuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [CustomeAuthController::class, 'logout']);
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::get("/user-courses",[UserController::class, 'userInfoApi']);

    Route::get('/chat/users', [ChatController::class, 'Shared_courses_users']);
    Route::get('/chat/messages/{id}', [ChatController::class, 'fetchMessages']);
    Route::post('/chat/send', [ChatController::class, 'sendMessage']);

});
