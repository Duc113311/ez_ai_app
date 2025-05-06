import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ez_ai_app/data/models/home/home_type.dart';
import 'package:ez_ai_app/helper/global.dart';
import 'package:ez_ai_app/presentation/widgets/home/home_card.dart';
import 'package:ez_ai_app/presentation/widgets/loading/form_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = false; // sau có thể fetch data rồi setState về false

    // mq = MediaQuery.of(context).size; // 👈 Gán giá trị thực tế tại đây
    Animate.restartOnHotReload = true;

    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                FormLoading(
                  isLoading: isLoading,
                  child: const HomeCard(type: HomeType.aiChatBot),
                ),
                FormLoading(
                  isLoading: isLoading,
                  child: const HomeCard(type: HomeType.aiImage),
                ),
                FormLoading(
                  isLoading: isLoading,
                  child: const HomeCard(type: HomeType.aiTranslator),
                ),
              ],
            )));
  }
}
