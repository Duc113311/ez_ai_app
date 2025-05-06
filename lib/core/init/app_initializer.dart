import 'package:ez_ai_app/presentation/controllers/history/history_controller.dart';
import 'package:get/get.dart';

class AppInitializer {
  static Future<void> init() async {
    // Inject controller tại đây
    Get.put(HistoryController());

    // Khởi tạo service khác nếu cần
  }
}
