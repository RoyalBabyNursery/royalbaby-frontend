import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royalbabyapp/parent/services/reports/progress_report.dart';
import 'package:royalbabyapp/parent/services/reports/term_report.dart';
import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/theme/fonts.dart';

import 'daily_report.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  int selectedTab = 0;

  final List<String> tabs = [
    'التقرير اليومي',
    'تقرير الفصل',
    'التقرير المرحلي',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.065),
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
                      height: MediaQuery.sizeOf(context).width * 0.045,
                      width: MediaQuery.sizeOf(context).width * 0.045,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'التقارير',
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      builder: (context) =>
                          const ReportFilterSheet(), // بننشئ الواجهة هنا
                    );
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
                      'assets/images/filter.png',
                      height: MediaQuery.sizeOf(context).width * 0.045,
                      width: MediaQuery.sizeOf(context).width * 0.045,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(width: 3),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: List.generate(tabs.length, (index) {
                final isSelected = selectedTab == index;
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? NewColors.primary400
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? LineColors.border
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Text(
                        tabs[index],
                        style: AppFonts.body3(
                          color: isSelected
                              ? NewColors.alwaysWhite
                              : Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            Expanded(
              child: Builder(
                builder: (_) {
                  switch (selectedTab) {
                    case 0:
                      return Expanded(
                        child: ListView.separated(
                          itemCount: 5,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DailyReport(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: NewColors.lightBG.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: LineColors.border),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/calendar.png',
                                                ),
                                                const SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'الأربعاء',
                                                      style: AppFonts.headingH6(
                                                        color:
                                                            NewColors.heading,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      '7 مايو 2025',
                                                      style: AppFonts.body4(
                                                        color: NewColors.body,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Text(
                                          'ممتاز',
                                          style: AppFonts.body4(
                                            color: NewColors.body,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Image.asset('assets/images/star.png'),
                                      ],
                                    ),
                                    const SizedBox(height: 16),

                                    /// الصف الثاني
                                    Row(
                                      children: [
                                        /// الحالة العامة
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/kissing emoj.png',
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'الحالة العامة',
                                                  style: AppFonts.body4(
                                                    color: NewColors.body,
                                                  ),
                                                ),
                                                Text(
                                                  'نشيط ومتفاعل',
                                                  style: AppFonts.body3(
                                                    color: NewColors.supHeading,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 20),

                                        /// الحضور والانصراف
                                        Image.asset('assets/images/timer.png'),
                                        const SizedBox(width: 5),
                                        Column(
                                          children: [
                                            Text(
                                              'الحضور والانصراف',
                                              style: AppFonts.body4(
                                                color: NewColors.body,
                                              ),
                                            ),
                                            Text(
                                              '7:45 ص - 2:15 م',
                                              style: AppFonts.body3(
                                                color: NewColors.supHeading,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Image.asset('assets/images/Vector.png'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    case 1:
                      return Expanded(
                        child: ListView.separated(
                          itemCount: 6,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const TermReport(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: NewColors.lightBG.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: LineColors.border),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/calendar.png',
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'الفصل الثاني',
                                                      style: AppFonts.headingH6(
                                                        color:
                                                            NewColors.heading,
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),
                                                    Text(
                                                      '7 مايو 2025',
                                                      style: AppFonts.body4(
                                                        color: NewColors.body,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Text(
                                          'ممتاز',
                                          style: AppFonts.body4(
                                            color: NewColors.body,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Image.asset('assets/images/star.png'),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Image.asset('assets/images/skills.png'),
                                        SizedBox(width: 10),
                                        Text(
                                          'المهارات المكتسبة :',
                                          style: AppFonts.body4(
                                            color: NewColors.body,
                                          ),
                                        ),
                                        Text(
                                          'زيادة الثقة بالنفس',
                                          style: AppFonts.body3(
                                            color: NewColors.supHeading,
                                          ),
                                        ),
                                        Spacer(),
                                        Image.asset('assets/images/Vector.png'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    case 2:
                      return Expanded(
                        child: ListView.separated(
                          itemCount: 6, // عدل العدد حسب عدد الأيام
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ProgressReport(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: NewColors.lightBG.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: LineColors.border),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/calendar.png',
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'الفتره الثاني',
                                                      style: AppFonts.headingH6(
                                                        color:
                                                            NewColors.heading,
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),
                                                    Text(
                                                      'من 1 مارس 25 إلى 15 أبريل 25',
                                                      style: AppFonts.body4(
                                                        color: NewColors.body,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Text(
                                          'ممتاز',
                                          style: AppFonts.body4(
                                            color: NewColors.body,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Image.asset('assets/images/star.png'),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Image.asset('assets/images/timer.png'),
                                        SizedBox(width: 10),
                                        Text(
                                          'الحضور :',
                                          style: AppFonts.body4(
                                            color: NewColors.body,
                                          ),
                                        ),
                                        Text(
                                          '45 يوم (90%)',
                                          style: AppFonts.body3(
                                            color: NewColors.supHeading,
                                          ),
                                        ),
                                        Spacer(),
                                        Image.asset('assets/images/Vector.png'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReportFilterSheet extends StatelessWidget {
  const ReportFilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: NewColors.alwaysWhite,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      'assets/images/Close Button Container.png',
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'تصفية التقارير',
                    style: AppFonts.supHeading2(color: NewColors.heading),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Text(
                'التاريخ',
                style: AppFonts.supHeading3(color: NewColors.supHeading),
              ),
              const SizedBox(height: 10),
              RadioListTile(
                title: Text(
                  'الأحدث أولاً (افتراضي)',
                  style: AppFonts.body2(color: NewColors.body),
                ),
                value: 'latest',
                groupValue: null,
                visualDensity: const VisualDensity(
                  horizontal: -4,
                  vertical: -4,
                ),
                onChanged: (_) {},
              ),
              RadioListTile(
                title: Text(
                  'الأقدم أولاً',
                  style: AppFonts.body2(color: NewColors.body),
                ),
                value: 'oldest',
                groupValue: null,
                visualDensity: const VisualDensity(
                  horizontal: -4,
                  vertical: -4,
                ),
                onChanged: (_) {},
              ),
              RadioListTile(
                title: Text(
                  'اختيار تاريخ محدد (من → إلى)',
                  style: AppFonts.body2(color: NewColors.body),
                ),
                value: 'custom',
                groupValue: null,
                visualDensity: const VisualDensity(
                  horizontal: -4,
                  vertical: -4,
                ),
                onChanged: (_) {},
              ),
              const Divider(height: 32, color: LineColors.line),
              Text(
                'التقييم العام',
                style: AppFonts.supHeading3(color: NewColors.supHeading),
              ),
              const SizedBox(height: 10),
              ...['ممتاز', 'جيد جداً', 'جيد', 'يحتاج متابعة'].map((label) {
                return RadioListTile(
                  title: Text(
                    label,
                    style: AppFonts.body2(color: NewColors.body),
                  ),
                  value: label,
                  groupValue: null,
                  visualDensity: const VisualDensity(
                    horizontal: -4,
                    vertical: -4,
                  ),
                  onChanged: (_) {},
                );
              }).toList(),
              SizedBox(height: 10),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.057,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: NewColors.primary500,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'حفظ',
                    style: AppFonts.buttonLg(color: NewColors.alwaysWhite),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
