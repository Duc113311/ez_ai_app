import 'package:ez_ai_app/core/base/dropdown/ai_option_sheet.dart';
import 'package:ez_ai_app/data/models/quick-action/action_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AIDropdownSelector extends StatefulWidget {
  const AIDropdownSelector({super.key});

  @override
  State<AIDropdownSelector> createState() => _AIDropdownSelectorState();
}

class _AIDropdownSelectorState extends State<AIDropdownSelector> {
  late AIOption selectedOption;

  final List<AIOption> options = [
    AIOption('ChatGPT', 'Newest, Fastest', 'assets/icons/ic_chatgpt.svg'),
    AIOption('Gemeni', 'Smart & Fast', 'assets/icons/ic_gemeni.svg'),
    AIOption('Grok', 'Newest & Fastest', 'assets/icons/ic_grok.svg'),
    AIOption('DeepSeek', 'Create images', 'assets/icons/ic_deepseek.svg'),
  ];

  @override
  void initState() {
    super.initState();
    selectedOption = options[0];
  }

  void _showOptionSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) => ListView(
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        children: options.map((option) {
          final isSelected = option.name == selectedOption.name;
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                setState(() => selectedOption = option);
                Navigator.pop(context);
              },
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
                    if (isSelected) const Icon(Icons.check, color: Colors.green)
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        final result = await showAIOptionSheet(
          context: context,
          options: options,
          selectedOption: selectedOption,
        );

        if (result != null) {
          setState(() {
            selectedOption = result;
          });
        }
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: BorderSide(color: Colors.grey.shade300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(selectedOption.iconPath, width: 20, height: 20),
          const SizedBox(width: 8),
          Text(selectedOption.name,
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_drop_down, size: 24),
        ],
      ),
    );
  }
}
