import 'package:ez_ai_app/presentation/screens/history/history_screen.dart';
import 'package:ez_ai_app/presentation/widgets/common/app_drawer.dart';
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
      drawer: const AppDrawer(),
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
