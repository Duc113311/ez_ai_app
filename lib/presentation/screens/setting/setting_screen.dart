import 'package:ez_ai_app/core/base/dropdown/ai_option_sheet.dart';
import 'package:ez_ai_app/data/models/quick-action/action_item.dart';
import 'package:ez_ai_app/presentation/widgets/package/credit_package_card.dart';
import 'package:ez_ai_app/presentation/widgets/setting/settings_tile.dart';
import 'package:ez_ai_app/presentation/widgets/sign_in/sign_in_promo_card.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late AIOption selectedOption;

  final List<AIOption> options = [
    AIOption('ChatGPT', 'Newest, Fastest', 'assets/icons/ic_chatgpt.svg'),
    AIOption('Gemeni', 'Smart & Fast', 'assets/icons/ic_gemeni.svg'),
    AIOption('Grok', 'Newest & Fastest', 'assets/icons/ic_grok.svg'),
    AIOption('DeepSeek', 'Create images', 'assets/icons/ic_deepseek.svg'),
  ];
  void onBuyNow() {
    // ví dụ: mở dialog thanh toán
  }

  void onViewAll() {
    // ví dụ: chuyển sang màn hiển thị toàn bộ gói
  }

  @override
  void initState() {
    super.initState();
    selectedOption = options[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
              right: 16,
            ),
            child: Column(children: [
              // const SizedBox(height: 12),
              SignInPromoCard(
                onSignInPressed: () {
                  // TODO: xử lý khi nhấn nút Sign In
                  print('User tapped Sign In');
                  // Ví dụ: Navigator.pushNamed(context, '/signin');
                },
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  CreditPackageCard(
                    onBuyNow: onBuyNow,
                    onViewAll: onViewAll,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                children: [
                  SettingsTile(
                    title: 'AI Chat',
                    trailing: selectedOption.name,
                    iconPath: 'assets/icons/ic_ai.svg',
                    iconContent: selectedOption.iconPath,
                    iconBgColor: Colors.blue,
                    isSelected: false,
                    onTap: () async {
                      final result = await showAIOptionSheet(
                        context: context,
                        options: options,
                        selectedOption: selectedOption,
                      );

                      if (result != null) {
                        setState(() {
                          selectedOption = result;
                        });
                      }
                    },
                  ),
                  SettingsTile(
                    title: 'Theme',
                    trailing: 'System',
                    iconPath: 'assets/icons/ic_theme.svg',
                    iconBgColor: Colors.deepPurple,
                    onTap: () {},
                  ),
                  SettingsTile(
                    title: 'Credit Purchase History',
                    iconPath: 'assets/icons/ic_history.svg',
                    iconBgColor: Colors.orange,
                    onTap: () {},
                  ),
                  SettingsTile(
                    title: 'Privacy Policy',
                    iconPath: 'assets/icons/ic_shield.svg',
                    iconBgColor: Colors.redAccent,
                    onTap: () {},
                  ),
                  SettingsTile(
                    title: 'Language',
                    trailing: 'English',
                    iconPath: 'assets/icons/ic_language.svg',
                    iconBgColor: Colors.teal,
                    onTap: () {},
                    showDivider: false, // 👈 KHÔNG có border cuối
                  ),
                ],
              )
            ])));
  }
}
