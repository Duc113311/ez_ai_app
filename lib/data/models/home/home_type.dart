import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ez_ai_app/presentation/screens/home/chat_bot/chat_bot_screen.dart';
import 'package:ez_ai_app/presentation/screens/home/image_create/image_create_screen.dart';
import 'package:ez_ai_app/presentation/widgets/common/back_home_screen.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType {
  // title
  String get title => switch (this) {
        HomeType.aiChatBot => 'AI ChatBot',
        HomeType.aiImage => 'AI Image Creator',
        HomeType.aiTranslator => 'Language Translator',
      };

  // lottie - image
  String get lottie => switch (this) {
        HomeType.aiChatBot => 'ai_hand_waving.json',
        HomeType.aiImage => 'ai_play.json',
        HomeType.aiTranslator => 'ai_ask_me.json',
      };

  // Alignment
  bool get leftAlign => switch (this) {
        HomeType.aiChatBot => true,
        HomeType.aiImage => false,
        HomeType.aiTranslator => true,
      };

  // Padding
  EdgeInsets get padding => switch (this) {
        HomeType.aiChatBot => EdgeInsets.zero,
        HomeType.aiImage => const EdgeInsets.all(20),
        HomeType.aiTranslator => EdgeInsets.zero,
      };

  // Widget
  Widget get childWidget => switch (this) {
        HomeType.aiChatBot => const ChatBotScreen(),
        HomeType.aiImage => const ImageCreateScreen(),
        HomeType.aiTranslator =>
          const Center(child: Text("🌐 Language Translator here")),
      };

  VoidCallback get onTap =>
      () => Get.to(() => BackHomeScreen(type: this, child: childWidget));
}
