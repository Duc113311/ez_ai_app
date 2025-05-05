import 'package:ez_ai_app/data/models/home/home_type.dart';
import 'package:flutter/material.dart';

class BackFeatureScreen extends StatelessWidget {
  final HomeType type;
  const BackFeatureScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 103, 207, 255),
        centerTitle: true, // 👈 căn giữa title
        title: Text(type.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _buildBody(type),
      ),
    );
  }

  Widget _buildBody(HomeType type) {
    switch (type) {
      case HomeType.aiChatBot:
        return const Center(child: Text("💬 Chatbot content here"));
      case HomeType.aiImage:
        return const Center(child: Text("🎨 AI Image Generator here"));
      case HomeType.aiTranslator:
        return const Center(child: Text("🌐 Language Translator here"));
      default:
        return const Center(child: Text("Coming soon..."));
    }
  }
}
