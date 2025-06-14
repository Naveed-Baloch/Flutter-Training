void main() {
  Conversation conversation = Conversation();
  conversation.chatId = 'chat123';
  conversation.meetingId = 'meet456';
  conversation.onConnection();
  conversation.sendMessage();
  conversation.invite();
  conversation.onMeetingJoined();

}

/// Mixin is reusing the code in multiple classes
/// With mixin we can reuse the code in multiple classes
/// Mixin are decleared using mixin along with mixin, with and on
/// [with] is used to apply the mixin on class
/// [on] when we need to apply the mixin for specific class

mixin ChatService {
  late String chatId;

  void sendMessage() {
    print('Message sent with chatId: $chatId');
  }

  void onConnection(){
    print('Connection established for ChatService');
  }

}

mixin MeetingService {
  late String meetingId;

  void invite() {
    print('Invited to meeting in meetingId: $meetingId');
  }

  void onMeetingJoined();

  void onConnection(){
    print('Connection established for MeetingService');
  }
}

class Conversation with MeetingService, ChatService {

  @override
  void onMeetingJoined() {
    print('Meeting joined');
  }
}