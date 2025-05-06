import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String? trailing;
  final String iconPath;
  final String iconContent;
  final Color iconBgColor;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool showDivider; // 👈 thêm dòng này

  const SettingsTile({
    super.key,
    required this.title,
    this.trailing,
    this.iconContent = '',
    required this.iconPath,
    required this.iconBgColor,
    this.isSelected = false,
    this.onTap,
    this.showDivider = true, // 👈 mặc định có border
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? Colors.grey.shade200 : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.grey.shade200 : Colors.transparent,
            // borderRadius: BorderRadius.circular(12),
            border: showDivider
                ? Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  )
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: iconBgColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: SvgPicture.asset(iconPath, width: 20, height: 20),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              if (trailing != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        iconContent,
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        trailing!,
                        style: const TextStyle(
                            fontSize: 15, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              SvgPicture.asset(
                'assets/icons/ic_chevron_right.svg',
                width: 16,
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
