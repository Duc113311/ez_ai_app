import 'package:flutter/material.dart';

class FormLoading extends StatelessWidget {
  final bool isLoading;
  final Widget? child;

  const FormLoading({
    super.key,
    required this.isLoading,
    this.child,
  });

  // loader-only constructor
  const FormLoading.loaderOnly({super.key})
      : isLoading = true,
        child = null;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        height: 200,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Color.fromARGB(154, 160, 189, 247),
          borderRadius: BorderRadius.circular(16),
        ),
      );
    } else {
      return child!;
    }
  }
}
