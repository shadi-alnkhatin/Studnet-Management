<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;

use App\Models\Course;
use App\Models\User;
use App\Models\Message;
use App\Events\MessageSent;
use Pusher\Pusher;
use Illuminate\Support\Facades\Validator;

use App\ApiResponse;

class ChatController extends Controller
{
    use ApiResponse;
    public function index(){
        $users = User::where('role','student')->get();
        $admins = User::where('role','admin')->get();
        $sharedUsers = User::where('id', '!=', Auth::id()) // Exclude the logged-in user
        ->whereHas('courses', function ($query) {
            $query->whereIn('courses.id', Auth::user()->courses->pluck('id'));
        })
        ->with(['courses' => function ($query) {
            $query->whereIn('courses.id', Auth::user()->courses->pluck('id'));
        }])
        ->get();


        if(auth()->user()->isAdmin()){
            return view('chat',compact('users','sharedUsers','admins'));
        }
        else{
            return view('user-chat',compact('users','sharedUsers','admins'));
        }
    }

    public function Shared_courses_users(){
        $admins = User::where('role','admin')->get();
        $sharedUsers = User::where('id', '!=', Auth::id()) // Exclude the logged-in user
        ->whereHas('courses', function ($query) {
            $query->whereIn('courses.id', Auth::user()->courses->pluck('id'));
        })
        ->with(['courses' => function ($query) {
            $query->select('courses.id', 'courses.title')
           ->whereIn('courses.id', Auth::user()->courses->pluck('id'));
        }])
        ->get();
        $data = [
            'admins' => $admins,
            'users' => $sharedUsers,
        ];

        return $this->successResponse(
            'users fetched successfully.',
            $data
        );

    }
    public function fetchMessages(Request $request, $receiverId)
    {
        $validated = $request->validate([
            'offset' => 'required|integer',
        ]);
        if(!User::find($receiverId)){
            return $this->errorResponse('User not found. ');
        }

    $messages = Message::where(function ($query) use ($receiverId) {
            $query->where('sender_id', Auth::id())
                  ->where('receiver_id', $receiverId);
        })
        ->orWhere(function ($query) use ($receiverId) {
            $query->where('sender_id', $receiverId)
                  ->where('receiver_id', Auth::id());
        })
        ->orderBy('created_at', 'desc')
        ->skip($validated['offset'])
        ->take(6) // Take the next 6 messages
        ->get();

        $data = [
            'messages' => $messages,
            'offset' => $validated['offset'],
        ];

        return $this->successResponse(
            'Messages fetched successfully.',
            $data
        );
    }


    public function sendMessage(Request $request)
    {
        $validated = $request->validate([
            'receiver_id' => 'required|exists:users,id',
            'message' => 'required|string',
        ]);

        $message = Message::create([
            'sender_id' => Auth::id(),
            'receiver_id' => $validated['receiver_id'],
            'message' => $validated['message'],
        ]);

        broadcast(new MessageSent($message))->toOthers();


        $data = [
            'message' => $message,
        ];

        return $this->successResponse(
            'Message sent successfully.',
            $data
        );
    }

}
