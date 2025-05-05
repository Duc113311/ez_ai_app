import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WritingItem extends StatefulWidget {
  final String iconPath; // là đường dẫn đến SVG
  final String title;
  final String description;
  final VoidCallback? onTap;

  const WritingItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  State<WritingItem> createState() => _WritingItemState();
}

class _WritingItemState extends State<WritingItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: SizedBox(
          // 👈 CHỈ CẦN THÊM NÀY
          height: 120, // 👈 chỉnh theo nhu cầu (ví dụ 110, 130...)
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _hovering ? Colors.grey.shade100 : Colors.white,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
              boxShadow: _hovering
                  ? [BoxShadow(color: Colors.black12, blurRadius: 4)]
                  : [],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    widget.iconPath, // truyền đường dẫn SVG từ widget
                    width: 28,
                    height: 28,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // 👈 canh giữa theo chiều dọc
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.description,
                        style: TextStyle(color: Colors.grey.shade700),
                        maxLines: 2, // 👈 tránh nhảy dòng quá dài
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
