import 'package:ez_ai_app/data/models/quick-action/action_item.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  var historyList = <ChatHistoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyData(); // hoặc load từ storage/api
  }

  void loadDummyData() {
    historyList.value = [
      ChatHistoryModel(
        aiName: 'ChatGPT',
        iconPath: 'assets/icons/ic_chatgpt.svg',
        title: 'Tell a bedtime story for the baby',
        subTitle: 'Snow White and the Seven Dwarfs...',
        dateTime: '07 Mar • 10:45 AM',
        cost: '-100 Credits',
        isStarred: true,
      ),
      ChatHistoryModel(
        aiName: 'Gemini',
        iconPath: 'assets/icons/ic_gemeni.svg',
        title: 'Write a product description',
        subTitle: 'Amazing phone with long battery...',
        dateTime: '07 Mar • 10:20 AM',
        cost: '-50 Credits',
        isStarred: true,
      ),
      ChatHistoryModel(
        aiName: 'Grok',
        iconPath: 'assets/icons/ic_grok.svg',
        title: 'Tell a bedtime story for the ba...',
        subTitle: 'Snow White and the Seven Dwarfs. Once up...',
        dateTime: '07 Mar • 10:20 AM',
        cost: '-50 Credits',
        isStarred: false,
      ),
      ChatHistoryModel(
        aiName: 'DeepSeek',
        iconPath: 'assets/icons/ic_deepseek.svg',
        title: 'Write a product description',
        subTitle: 'Amazing phone with long battery...',
        dateTime: '07 Mar • 10:20 AM',
        cost: '-50 Credits',
      ),
      ChatHistoryModel(
        aiName: 'DeepSeek',
        iconPath: 'assets/icons/ic_deepseek.svg',
        title: 'Write a product description',
        subTitle: 'Amazing phone with long battery...',
        dateTime: '07 Mar • 10:20 AM',
        cost: '-50 Credits',
      ),
      ChatHistoryModel(
        aiName: 'Gemini',
        iconPath: 'assets/icons/ic_gemeni.svg',
        title: 'Write a product description',
        subTitle: 'Amazing phone with long battery...',
        dateTime: '07 Mar • 10:20 AM',
        cost: '-50 Credits',
        isStarred: true,
      ),
      ChatHistoryModel(
        aiName: 'Gemini',
        iconPath: 'assets/icons/ic_gemeni.svg',
        title: 'Write a product description',
        subTitle: 'Amazing phone with long battery...',
        dateTime: '07 Mar • 10:20 AM',
        cost: '-50 Credits',
        isStarred: true,
      ),
    ];
  }

  void toggleStar(int index) {
    historyList[index].isStarred = !historyList[index].isStarred;
    historyList.refresh(); // để notify UI cập nhật
  }
}
