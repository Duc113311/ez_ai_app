// 📁 lib/shared/ui/ai_option_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ez_ai_app/data/models/quick-action/action_item.dart';

Future<AIOption?> showAIOptionSheet({
  required BuildContext context,
  required List<AIOption> options,
  required AIOption selectedOption,
}) {
  return showModalBottomSheet<AIOption>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => ListView(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      children: options.map((option) {
        final isSelected = option.name == selectedOption.name;
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => Navigator.pop(context, option),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(option.iconPath, width: 28, height: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(option.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 4),
                        Text(option.description,
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 13)),
                      ],
                    ),
                  ),
                  if (isSelected) const Icon(Icons.check, color: Colors.green),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
