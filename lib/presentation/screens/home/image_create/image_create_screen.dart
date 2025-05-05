import 'package:flutter/material.dart';

class ImageCreateScreen extends StatelessWidget {
  const ImageCreateScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(16),
            child: const Column(
              children: [
                Text('Image Create Screen'),
              ],
            )));
  }
}
