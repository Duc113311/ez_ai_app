import 'package:flutter/material.dart';
import 'package:ez_ai_app/core/init/app_initializer.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: '.env'); // ⬅️ Load .env ở đây

  await AppInitializer.init(); // ✅ gom hết khởi tạo vào đây

  runApp(const MyApp());
}
