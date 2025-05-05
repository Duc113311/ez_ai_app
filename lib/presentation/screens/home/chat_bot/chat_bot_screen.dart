// import 'package:ez_ai_app/presentation/widgets/chat/input_chat_screen.dart';
// import 'package:ez_ai_app/presentation/widgets/chat/message_list_screen.dart';
import 'package:flutter/material.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return Column(
      children: [
        // Nội dung chat phía trên (có thể thay bằng ListView ở đây)
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            // child: MessageListScreen(scrollController: _scrollController),
          ),
        ),

        // 👉 Phần nhập tin nhắn có background riêng
        // InputChatScreen(scrollController: _scrollController)
      ],
    );
  }
}
