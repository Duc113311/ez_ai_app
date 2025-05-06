import 'package:ez_ai_app/data/models/quick-action/action_item.dart';
import 'package:ez_ai_app/presentation/controllers/history/history_controller.dart';
import 'package:ez_ai_app/presentation/widgets/dropdown/ai_dropdown_selector.dart';
import 'package:ez_ai_app/presentation/widgets/dropdown/date_dropdown_start_end.dart';
import 'package:ez_ai_app/presentation/widgets/history/title_history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final controller = Get.find<HistoryController>();

  DateTime? _startDate;
  DateTime? _endDate;
  bool _isDateFilterActive = false;

  Future<void> _handleOpenDatePicker() async {
    final result = await openDateRangePicker(
      context: context,
      initialStartDate: _startDate,
      initialEndDate: _endDate,
    );

    if (result != null) {
      setState(() {
        _startDate = result['startDate'];
        _endDate = result['endDate'];
        _isDateFilterActive = _startDate != null && _endDate != null;
      });

      // (Tùy chọn) Gọi hàm filter theo ngày ở đây nếu cần
    }
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
        child: Column(
          children: [
            // Header row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'History',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Sort by'),
                )
              ],
            ),
            const SizedBox(height: 12),

            // 🔍 Search input
            TextField(
              onChanged: (value) {
                print('Searching: $value');
              },
              decoration: InputDecoration(
                hintText: 'Search in history...',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                prefixIcon: const Icon(Icons.search, color: Colors.teal),
                filled: true,
                fillColor: const Color(0xFFE5E7EB),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                const Text(
                  'Filter by',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF166534),
                      fontSize: 16 // Màu xanh đậm nhẹ
                      ),
                ),
                const SizedBox(width: 12),
                const AIDropdownSelector(),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: _handleOpenDatePicker,
                  icon: const Icon(Icons.calendar_today, size: 18),
                  label: const Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(
                      color: _isDateFilterActive
                          ? Theme.of(context).primaryColor
                          : Colors.grey.shade300,
                    ),
                    backgroundColor: _isDateFilterActive
                        ? Theme.of(context).primaryColor.withOpacity(0.1)
                        : Colors.transparent,
                    foregroundColor: _isDateFilterActive
                        ? Theme.of(context).primaryColor
                        : Colors.black87,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                  ),
                )
              ],
            ),

            const SizedBox(height: 12),

            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.historyList.length,
                    itemBuilder: (context, index) {
                      final item = controller.historyList[index];
                      return TitleHistoryItem(
                        aiName: item.aiName,
                        iconPath: item.iconPath,
                        title: item.title,
                        subTitle: item.subTitle,
                        dateTime: item.dateTime,
                        cost: item.cost,
                        isStarred: item.isStarred,
                        onTap: () {
                          // xử lý khi bấm vào item
                        },
                        onStarToggle: () => controller.toggleStar(index),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void showAIOptionsModal(BuildContext context, Function(AIOption) onSelected) {
    final options = [
      AIOption('ChatGPT', 'Newest, Fastest', 'assets/icons/ic_chatgpt.svg'),
      AIOption('Gemeni', 'Smart & Fast', 'assets/icons/ic_gemini.svg'),
      AIOption('Grok', 'Newest & Fastest', 'assets/icons/ic_grok.svg'),
      AIOption('DeepSeek', 'Create images', 'assets/icons/ic_deepseek.svg'),
    ];

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            children: options.map((option) {
              return InkWell(
                onTap: () {
                  Navigator.pop(context);
                  onSelected(option);
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(option.iconPath, width: 28, height: 28),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(option.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(height: 4),
                            Text(option.description,
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 13)),
                          ],
                        ),
                      ),
                      const Icon(Icons.check, color: Colors.green)
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
