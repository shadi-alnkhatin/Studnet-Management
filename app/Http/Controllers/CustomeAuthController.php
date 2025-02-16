<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\ApiResponse;
use Illuminate\Support\Facades\Validator;



class CustomeAuthController extends Controller
{
    use ApiResponse;
    public function register(Request $request)
    {
         $validated = $request->validate([
             'name' => 'required|string|max:255',
             'email' => 'required|string|email|max:255|unique:users',
             'password' => 'required|string|min:8',
         ]);

         $user = User::create([
             'name' => $validated['name'],
             'email' => $validated['email'],
             'password' => bcrypt($validated['password']),
         ]);

         $token = $user->createToken('auth_token')->plainTextToken;

         return $this->successResponse('User registered successfully', [
             'user' => $user,
             'token' => $token,
         ]);
   }

   public function login(Request $request)
    {
       $credentials = $request->validate([
           'email' => 'required|email',
           'password' => 'required',
       ]);

       if (!Auth::attempt($credentials)) {
           return $this->errorResponse("Invalid credentials",400);
       }

       $user = Auth::user();
       $token = $user->createToken('auth_token')->plainTextToken;

       return $this->successResponse('User logged in successfully', [
         'user' => $user,
         'token' => $token,
       ]);
    }
    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();

        return $this->successResponse('User logged out successfully');
    }


}
