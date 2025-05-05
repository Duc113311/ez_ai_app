import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:ez_ai_app/core/services/prefs_service.dart';
import 'package:ez_ai_app/routes/route_generator.dart';
// import 'config/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Clean App',
      debugShowCheckedModeBanner: false,
      // themeMode: PrefService.defaultTheme,
      initialRoute: RouteGenerator.splash, // tab bar 5 màn là route chính
      routes: RouteGenerator.routes, // khai báo route trong app
    );
  }
}

extension AppTheme on ThemeData {
  //light text color
  Color get lightTextColor =>
      brightness == Brightness.dark ? Colors.white70 : Colors.black54;

  //button color
  Color get buttonColor =>
      brightness == Brightness.dark ? Colors.cyan.withOpacity(.5) : Colors.blue;
}
