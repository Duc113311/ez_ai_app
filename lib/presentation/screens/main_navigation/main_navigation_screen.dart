import 'package:ez_ai_app/presentation/screens/history/history_screen.dart';
import 'package:ez_ai_app/presentation/widgets/header/app_header.dart';
import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../quick_action/quick_action_screen.dart';
import '../setting/setting_screen.dart';
import 'package:flutter_svg/svg.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    QuickActionScreen(),
    HistoryScreen(),
    SettingScreen(),
  ];

  final List<String> _titles = [
    'Home',
    'Quick Actions',
    'History',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        onMenuTap: () {
          // tuỳ xử lý: mở drawer, mở menu, in log...
          print('Menu icon tapped');
        },
      ),
      drawer: Drawer(
          width: 350,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // 👈 bỏ bo tròn
          ),
          child: Container(
            width: MediaQuery.of(context).size.width, // full width
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
                InkWell(
                  splashColor: Colors.teal.withOpacity(0.2), // hiệu ứng lan
                  highlightColor:
                      Colors.teal.withOpacity(0.05), // hiệu ứng nhấn
                  onTap: () {
                    // TODO: xử lý khi bấm
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Row(
                      children: [
                        // Icon bên trái
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFCCDBED),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/ic_chatbot.svg', // đổi đường dẫn icon tại đây
                            width: 24,
                            height: 24,
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Tiêu đề
                        const Expanded(
                          child: Text(
                            'AI Chat',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'GPT',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black87),
                            ),
                            const SizedBox(width: 4),
                            SvgPicture.asset(
                              'assets/icons/ic_arrow_right.svg',
                              width: 16,
                              height: 16,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // TODO: xử lý khi bấm
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Row(
                      children: [
                        // Icon bên trái
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFCCDBED),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/ic_theme.svg', // đổi đường dẫn icon tại đây
                            width: 20,
                            height: 20,
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Tiêu đề
                        const Expanded(
                          child: Text(
                            'Theme',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'System',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black87),
                            ),
                            const SizedBox(width: 4),
                            SvgPicture.asset(
                              'assets/icons/ic_arrow_right.svg',
                              width: 16,
                              height: 16,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.attractions), label: 'Quick Actions'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
