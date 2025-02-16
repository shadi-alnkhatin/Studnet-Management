
    @extends('layouts.base')

    @push('admin-head')
    <meta name="userId" content="{{ auth()->id() }}">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="{{asset('assets/css/chat.css')}}" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">


    @endpush



    @section('content')



    <!-- char-area -->
    <section class="message-area">


        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="chat-area">
                        <!-- chatlist -->
                        <div class="chatlist">
                            <div class="modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="chat-header">
                                        <div class="msg-search">
                                            <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Search" aria-label="search">
                                            <a class="add" href="#"><img class="img-fluid" src="https://mehedihtml.com/chatbox/assets/img/add.svg" alt="add"></a>
                                        </div>


                                    </div>

                                    <div class="modal-body">
                                        <!-- chat-list -->
                                        <div class="chat-lists">
                                            <div class="tab-content" id="myTabContent">
                                                <div class="tab-pane fade show active" id="Open" role="tabpanel" aria-labelledby="Open-tab">
                                                    <!-- Dynamic User List -->
                                                    <div class="chat-list">
                                                        @if (auth()->user()->isAdmin())
                                                            @foreach ($users as $user)
                                                                <a href="#" class="d-flex align-items-center" data-user-id="{{ $user->id }}"
                                                                      data-user-name="{{ $user->name }}"data-user-role="{{ $user->role }}"
                                                                    >
                                                                    <div class="flex-shrink-0">
                                                                        <i class="fas fa-user"></i>
                                                                    </div>
                                                                    <div class="flex-grow-1 ms-3" id="user_info">
                                                                        <h3>{{ $user->name }}</h3>
                                                                        <p>{{ $user->role }}</p>
                                                                    </div>
                                                                </a>
                                                            @endforeach
                                                        @else
                                                            @foreach ($sharedUsers as $user)
                                                                <a href="#" class="d-flex align-items-center" data-user-id="{{ $user->id }}"
                                                                          data-user-name="{{ $user->name }}"data-user-role="{{ $user->role }}"
                                                                    >
                                                                    <div class="flex-shrink-0">
                                                                        <i class="fas fa-user"></i>
                                                                    </div>
                                                                    <div class="flex-grow-1 ms-3" id="user_info">
                                                                        <h3>{{ $user->name }}</h3>
                                                                        <p>
                                                                            @foreach ($user->courses as $course)
                                                                                <span class="badge bg-primary me-1">{{ $course->title }}</span>
                                                                            @endforeach
                                                                        </p>

                                                                        <p>{{ $user->role }}</p>
                                                                    </div>
                                                                </a>
                                                            @endforeach

                                                            @foreach ($admins as $admin)
                                                                <a href="#" class="d-flex align-items-center" data-user-id="{{ $admin->id }}"
                                                                            data-user-name="{{ $admin->name }}"data-user-role="{{ $admin->role }}"
                                                                    >
                                                                    <div class="flex-shrink-0">
                                                                        <i class="fas fa-user"></i>                                                                </div>
                                                                    <div class="flex-grow-1 ms-3" id="user_info">
                                                                        <h3>{{ $admin->name }}</h3>
                                                                        <p>{{ $admin->role }}</p>
                                                                    </div>
                                                                </a>
                                                            @endforeach
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- chatlist -->

                        <!-- chatbox -->
                        <div class="chatbox">
                            <div class="modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="msg-head">
                                        <div class="row">
                                            <div class="col-8">
                                                <div class="d-flex align-items-center">
                                                    <span class="chat-icon"><img class="img-fluid" src="https://mehedihtml.com/chatbox/assets/img/arroleftt.svg" alt="image title"></span>
                                                    <div class="flex-shrink-0">
                                                        {{-- <img class="img-fluid" src="https://mehedihtml.com/chatbox/assets/img/user.png" alt="user img"> --}}
                                                    </div>
                                                    <div class="flex-grow-1 ms-3">
                                                        <h3 id="chatUserName">Select a user</h3>
                                                        <p id="chatUserRole">Role</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">

                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal-body">
                                        <div class="msg-body" >
                                            <div id="loadingSpinner" style="display: none; text-align: center;">
                                                <div class="spinner"></div>
                                            </div>
                                            <ul id="chatWindow">

                                            </ul>
                                            <!-- Messages will be loaded here dynamically -->
                                        </div>
                                    </div>

                                    <div class="send-box">
                                        <form id="sendMessageForm">
                                            <input type="text" class="form-control" id="messageInput" placeholder="Write message…">
                                            <button type="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i> Send</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- chatbox -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    @endsection



    @push('admin-scripts')
    <script src="https://js.pusher.com/7.2/pusher.min.js"></script>
    <script src="{{asset('assets/js/chat.js')}}"></script>
    <script src="{{asset('assets/js/scripts.js')}}"></script>

    @endpush



