import 'package:flutter/material.dart';
import '../../presentation/screens/main_navigation/main_navigation_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart'; // 👈 import splash mới

class RouteGenerator {
  static const String splash = '/splash'; // 👈 thêm
  static const String main = '/main';

  static final routes = <String, WidgetBuilder>{
    splash: (context) => const SplashScreen(), // 👈 thêm dòng này
    main: (context) => const MainNavigationScreen(),
  };
}
