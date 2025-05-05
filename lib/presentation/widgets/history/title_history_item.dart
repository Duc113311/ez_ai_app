import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleHistoryItem extends StatelessWidget {
  final String aiName;
  final String iconPath;
  final String title;
  final String subTitle;
  final String dateTime;
  final String cost;
  final bool isStarred;
  final VoidCallback? onTap;
  final VoidCallback? onStarToggle; // ✅ thêm callback này

  const TitleHistoryItem({
    super.key,
    required this.aiName,
    required this.iconPath,
    required this.title,
    required this.subTitle,
    required this.dateTime,
    required this.cost,
    this.isStarred = false,
    this.onTap,
    this.onStarToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Icon AI
            SvgPicture.asset(iconPath, width: 36, height: 36),
            const SizedBox(width: 12),

            // Main content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$aiName Chatbox',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // Side: time, cost, star
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(dateTime,
                    style:
                        TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                const SizedBox(height: 4),
                Text(
                  cost,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    GestureDetector(
                      onTap: onStarToggle, // ✅ gọi callback
                      child: SvgPicture.asset(
                        isStarred
                            ? 'assets/icons/ic_star.svg'
                            : 'assets/icons/ic_star_border.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    SvgPicture.asset(
                      'assets/icons/ic_more_vert.svg',
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
