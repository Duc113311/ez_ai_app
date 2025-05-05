enum MessageType { user, bot }

class ChatMessage {
  final String content;
  final MessageType type;

  ChatMessage({required this.content, required this.type});
}
