import 'package:flutter/material.dart';
import 'package:ez_ai_app/data/models/home/home_type.dart';

class BackHomeScreen extends StatelessWidget {
  final HomeType type;
  final Widget child;

  const BackHomeScreen({
    super.key,
    required this.type,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 103, 207, 255),
        centerTitle: true,
        title: Text(type.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: child,
      ),
    );
  }
}
