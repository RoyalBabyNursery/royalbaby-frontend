import 'package:flutter/material.dart';
import 'package:royalbabyapp/teacher/home/all_screen.dart';

import '../../theme/colors.dart';
import '../../theme/fonts.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int selectedTabIndex = 0;

  final List<String> tabs = ['الكل', 'إدارية', 'تقارير', 'أولياء الأمور'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: MediaQuery.sizeOf(context).width * 0.091,
                    width: MediaQuery.sizeOf(context).width * 0.091,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: LineColors.border, width: 1),
                    ),
                    child: Image.asset(
                      'assets/images/Dropdown Icon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'الإشعارات',
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
                const Spacer(),
                Text(
                  'تحديد الكل كمقروء',
                  style: AppFonts.body3(color: NewColors.blue),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(tabs.length, (index) {
                final isSelected = selectedTabIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTabIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? NewColors.primary400
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? NewColors.primary400
                            : LineColors.border,
                      ),
                    ),
                    child: Text(
                      tabs[index],
                      style: AppFonts.body3(
                        color: isSelected
                            ? NewColors.alwaysWhite
                            : NewColors.body,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: IndexedStack(
                index: selectedTabIndex,
                children: const [
                  AllScreen(),
                  //AdminNotificationsPage(),
                  // ReportsNotificationsPage(),
                  //ParentsNotificationsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
