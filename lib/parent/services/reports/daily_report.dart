import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/widget/container.dart';

import '../../../theme/fonts.dart';

class DailyReport extends StatefulWidget {
  const DailyReport({super.key});

  @override
  State<DailyReport> createState() => _DailyReportState();
}

class _DailyReportState extends State<DailyReport> {
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
                  'تفاصيل التقرير',
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
              ],
            ),
            SizedBox(height: 20),
            DailyEvaluationCard(
              day: 'الأربعاء',
              date: '7 مايو 2025',
              evaluation: 'ممتاز',
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: NewColors.lightBG.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: LineColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'الأنشطة',
                          style: AppFonts.supHeading3(
                            color: NewColors.supHeading,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'نشاط تعليمي: تعلم الحروف (أ، ب، ت)',
                                style: AppFonts.body3(color: NewColors.body),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'نشاط فني: رسم لوحة عن "الربيع"',
                                style: AppFonts.body3(color: NewColors.body),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'نشاط حركي: لعب في ساحة الألعاب',
                                style: AppFonts.body3(color: NewColors.body),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            TeacherNoteCard(
              title: 'ملاحظات المعلمة',
              note:
                  'الطفل كان سعيدًا اليوم، شارك أصدقاءه اللعب، وأبدى اهتمامًا كبيرًا بالرسم',
            ),
          ],
        ),
      ),
    );
  }
}
