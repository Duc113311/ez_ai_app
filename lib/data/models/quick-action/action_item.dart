// file: lib/models/action_item.dart
import 'package:flutter/material.dart';

class ActionItem {
  final IconData icon;
  final String label;
  final bool selected;

  ActionItem(this.icon, this.label, {this.selected = false});
}

class WritingFeature {
  final String iconPath;
  final String title;
  final String description;

  WritingFeature(this.iconPath, this.title, this.description);
}

class AIOption {
  final String name;
  final String description;
  final String iconPath;

  AIOption(this.name, this.description, this.iconPath);
}

class ChatHistoryModel {
  final String aiName;
  final String iconPath;
  final String title;
  final String subTitle;
  final String dateTime;
  final String cost;
  bool isStarred;

  ChatHistoryModel({
    required this.aiName,
    required this.iconPath,
    required this.title,
    required this.subTitle,
    required this.dateTime,
    required this.cost,
    this.isStarred = false,
  });
}
