$(document).ready(function () {
    let receiverId="";
    let offset = 6;
    const csrfToken = $('meta[name="csrf-token"]').attr('content'); // Fetch CSRF token
    const userId=  $('meta[name="userId"]').attr('content');

    $('.chat-list a').on('click', function () {
        offset=6;
         receiverId = $(this).data('user-id');
        console.log(receiverId);
        const userName=$(this).data('user-name');
        const userRole=$(this).data('user-role');
        $('#chatUserRole').text(userRole);
        $('#chatUserName').text(userName);

        if (receiverId) {
            $.ajax({
                url: `/chat/messages/${receiverId}`,
                type: 'GET',
                data: { offset: 0 },
                success: function (messages) {
                    $('#chatWindow').html('');
                    messages.data.messages.reverse().forEach(message => appendMessage(message));
                },
                error: function (xhr) {
                    console.error(xhr.responseJSON.message || 'An error occurred');
                },
            });
        }
    });

$('#sendMessageForm').on('submit', function (e) {
    e.preventDefault();

    const message = $('#messageInput').val();
    console.log(receiverId);
    if (!message || !receiverId) {

        return;
    }
    $.ajax({
        url: '/chat/send',
        type: 'POST',
        headers: { 'X-CSRF-TOKEN': csrfToken },
        data: { message, receiver_id: receiverId },
        success: function (response) {
            $('#messageInput').val(''); // Clear input
            appendMessage(response.data.message);
        },
        error: function (xhr) {
            console.error(xhr.responseJSON.message || 'An error occurred');
        },
    });
});


  function fetchMessages( ) {
    const chatWindow = $('#chatWindow');
    const loadingSpinner = $('#loadingSpinner');

    // Show the loading spinner
    loadingSpinner.show();
    $.ajax({
        url: `/chat/messages/${receiverId}`,
        type: 'GET',
        data: { offset: offset },
        success: function (messages) {
            if (messages.length === 0 ) {
                loadingSpinner.hide();
                return};

            messages.data.messages.forEach(message => {
                const messageElement = `<li class="message ${message.sender_id == userId ? 'sender' : 'repaly'}">
                    <p>${message.message}</p>
                </li>`;
                chatWindow.prepend(messageElement);
            });

            offset += messages.data.messages.length;
            loadingSpinner.hide();
        },
        error: function (xhr) {
            loadingSpinner.hide();
            console.error('Error fetching messages:', xhr.responseJSON.message || 'An error occurred');
        },
    });
  }

$('.modal-body').eq(1).on('scroll', function () {
    if ($(this).scrollTop() == 0) {
        fetchMessages();
    }
});


function appendMessage(message) {
    console.log("append working...");



    console.log('Message sender_id:', message.sender_id);
    console.log('Current userId:', userId);

    const messageElement = `<li class="message ${message.sender_id == userId ? 'sender' : 'repaly'}">
        <p>${message.message}</p>
    </li>`;

    const chatWindow = $('#chatWindow');
    if (chatWindow.length > 0) {
        chatWindow.append(messageElement);
        scrollToBottom();
    } else {
        console.error('Chat window <ul> element not found!');
    }
}



function scrollToBottom() {
    const chatWindows = document.querySelectorAll('.modal-body');
    if (chatWindows.length > 0) {
        chatWindows[1].scrollTop = chatWindows[1].scrollHeight;
    } else {
        console.error('No chat windows found!');
    }
}

const pusher = new Pusher('1e0918024abc1c0c3ffb', {
    cluster: 'ap2',
    forceTLS: true, // Ensure TLS is enabled
});

pusher.connection.bind('state_change', function(states) {
    console.log('Pusher connection state changed:', states.current);
});

const channel = pusher.subscribe('chat-channel');

channel.bind('pusher:subscription_succeeded', function() {
    console.log('Successfully subscribed to the channel:', channel.name);
});

channel.bind('pusher:subscription_error', function(status) {
    console.error('Failed to subscribe to the channel:', status);
});

channel.bind(`message-sent-${userId}`, function(data) {
    console.log('Received message:', data);

    const messageElement = `<li class="message ${data.message.sender_id == userId ? 'sender' : 'repaly'}">
        <p>${data.message.message}</p>
    </li>`;

    // Update the selector to directly target the <ul> inside #chatWindow
    const chatWindow = $('#chatWindow');
    if (chatWindow.length > 0) {
        chatWindow.append(messageElement);
        scrollToBottom();
        toastr.success('there is a new message sent to you');
    } else {
        console.error('Chat window <ul> element not found!');
    }});


    $(".chat-list a").click(function() {
        $(".chatbox").addClass('showbox');
        return false;
    });

    $(".chat-icon").click(function() {
        $(".chatbox").removeClass('showbox');
    });

});

