
@if (auth()->check())
<!-- Navigation Bar -->
<nav class="bg-blue-600 p-4 text-white">
    <div class="container mx-auto flex justify-between items-center">
        <a href="/dashboard" class="text-2xl font-bold" style="color: white">Student Dashboard</a>

        <div class="space-x-4 flex items-center">
            <a href="/profile" class="hover:text-gray-200"style="color: white">Profile</a>

            <a href="/dashboard" class="hover:text-gray-200" style="color: white">Courses</a>
            <a href="{{route('chat.index')}}" class="hover:text-gray-200" style="color: white">Chat Now!</a>

            <form action="{{ route('logout') }}" method="POST" class="inline">
                @csrf
                <button type="submit" class="bg-white text-blue-600 px-4 py-2 rounded hover:bg-gray-200">
                    Logout
                </button>
            </form>
        </div>
    </div>
</nav>
@else
   <!-- Navigation Bar -->
   <nav class="bg-blue-600 p-4 text-white text-light">
    <div class="container mx-auto flex justify-between items-center">
        <a href="/dashboard" class="text-2xl font-bold"style="color: white">Student System</a>
        <div class="space-x-4">
            <a href="#" class="hover:text-gray-200 "style="color: white">Home</a>
            <a href="#" class="hover:text-gray-200"style="color: white">About</a>
            <a href="#" class="hover:text-gray-200"style="color: white">Courses</a>
            <a href="#" class="hover:text-gray-200"style="color: white">Contact</a>

            <a href="/login" class="bg-white text-blue-600 px-4 py-2 rounded hover:bg-gray-200">Login</a>
        </div>
    </div>
</nav>

@endif
