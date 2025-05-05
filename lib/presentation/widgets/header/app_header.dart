import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onRefreshTap;
  final int coin;

  const AppHeader({
    super.key,
    this.onMenuTap,
    this.onRefreshTap,
    this.coin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 103, 207, 255),
      automaticallyImplyLeading: false,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    splashColor: Colors.teal.withOpacity(0.2), // hiệu ứng lan
                    highlightColor: Colors.teal.withOpacity(0.1),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0), // optional touch area
                      child: SvgPicture.asset(
                        'assets/icons/ic_menu.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    splashColor: Colors.teal.withOpacity(0.2), // hiệu ứng lan
                    highlightColor: Colors.teal.withOpacity(0.1),
                    onTap: onMenuTap,
                    child: Padding(
                      padding: const EdgeInsets.all(0), // optional touch area
                      child: SvgPicture.asset(
                        'assets/icons/ic_reload.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'EZ AI',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFE1EFED),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Text(
                    '$coin',
                    style: const TextStyle(
                      color: Color(0xFF2D6965),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.diamond, size: 18, color: Color(0xFF2D6965)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
