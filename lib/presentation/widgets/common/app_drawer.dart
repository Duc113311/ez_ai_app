// lib/presentation/widgets/common/app_drawer.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 48,
                  height: 48,
                ),
                const SizedBox(height: 8),
                const Text(
                  'EZ AI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Xin chào, Duc!',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // _buildDrawerItem(
          //   context,
          //   iconPath: 'assets/icons/ic_chatbot.svg',
          //   label: 'AI Chat',
          //   trailing: 'GPT',
          //   onTap: () {},
          // ),
          // _buildDrawerItem(
          //   context,
          //   iconPath: 'assets/icons/ic_theme.svg',
          //   label: 'Theme',
          //   trailing: 'System',
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }

  // Widget _buildDrawerItem(
  //   BuildContext context, {
  //   required String iconPath,
  //   required String label,
  //   String? trailing,
  //   required VoidCallback onTap,
  // }) {
  //   return InkWell(
  //     splashColor: Colors.teal.withOpacity(0.2),
  //     highlightColor: Colors.teal.withOpacity(0.05),
  //     onTap: onTap,
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  //       color: Colors.white,
  //       child: Row(
  //         children: [
  //           Container(
  //             padding: const EdgeInsets.all(8),
  //             decoration: BoxDecoration(
  //               color: const Color(0xFFCCDBED),
  //               borderRadius: BorderRadius.circular(12),
  //             ),
  //             child: SvgPicture.asset(iconPath, width: 24, height: 24),
  //           ),
  //           const SizedBox(width: 12),
  //           Expanded(
  //             child: Text(
  //               label,
  //               style:
  //                   const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  //             ),
  //           ),
  //           if (trailing != null)
  //             Row(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Text(trailing,
  //                     style:
  //                         const TextStyle(fontSize: 15, color: Colors.black87)),
  //                 const SizedBox(width: 4),
  //                 SvgPicture.asset(
  //                   'assets/icons/ic_arrow_right.svg',
  //                   width: 16,
  //                   height: 16,
  //                   fit: BoxFit.contain,
  //                 ),
  //               ],
  //             ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
