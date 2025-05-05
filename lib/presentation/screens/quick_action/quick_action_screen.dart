import 'package:ez_ai_app/data/models/quick-action/action_item.dart';
import 'package:ez_ai_app/presentation/widgets/quick_action/writing_item.dart';
import 'package:flutter/material.dart';

class QuickActionScreen extends StatelessWidget {
  const QuickActionScreen({super.key});

  static List<ActionItem> actionItems = [
    ActionItem(Icons.work_outline, 'Career', selected: true),
    ActionItem(Icons.translate, 'Translate'),
    ActionItem(Icons.image_outlined, 'Image'),
    ActionItem(Icons.photo, 'Photo'),
    ActionItem(Icons.access_alarm, 'Photo'),
    ActionItem(Icons.photo, 'Photo'),
    ActionItem(Icons.photo, 'Photo'),
  ];

  static List<WritingFeature> features = [
    WritingFeature('assets/images/writing_email.png', 'Email Writing',
        'Create a well-written email based on the desired subject'),
    WritingFeature('assets/images/content_writing.png', 'Content Writing',
        'Words that inspire, captivate with a clear purpose'),
    WritingFeature('assets/images/essay_writing.png', 'Essay Writing',
        'Write professional essays that inspire and impress'),
    WritingFeature('assets/images/create_writing.png', 'Creative Writing',
        'Write compelling stories, scripts, and poetry. Get inspired with ideas for novels and movies'),
    WritingFeature('assets/images/cv_writing.png', 'CV Writing',
        'Create a professional and well-structured CVs'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Quick Actions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See all'),
                )
              ],
            ),
            const SizedBox(height: 12),

            // Action buttons
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(right: 16),
                itemCount: actionItems.length,
                itemBuilder: (context, index) {
                  final item = actionItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: _buildActionButton(
                      icon: item.icon,
                      label: item.label,
                      selected: item.selected,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // Writing Feature list
            Expanded(
              child: ListView.builder(
                itemCount: features.length,
                itemBuilder: (context, index) {
                  final item = features[index];
                  return WritingItem(
                    iconPath: item.iconPath,
                    title: item.title,
                    description: item.description,
                    onTap: () {
                      // Xử lý khi bấm
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    bool selected = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 1),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFA1EAC8) : Colors.transparent,
          border: Border.all(
            color: selected ? const Color(0xFF39B58A) : Colors.black26,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              child: Icon(icon, size: 18),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selected ? const Color(0xFF1A7C5C) : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
