import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royalbabyapp/theme/colors.dart';

import '../../../theme/fonts.dart';
import '../../../widget/container.dart';

class ProgressReport extends StatefulWidget {
  const ProgressReport({super.key});

  @override
  State<ProgressReport> createState() => _TermReportState();
}

class _TermReportState extends State<ProgressReport> {
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
              day: 'الفتره الاولي',
              date: 'من 1 مارس 25 إلى 15 أبريل 25',
              evaluation: 'جيد جدا',
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
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
                          'المهارات المعرفية',
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
                                'يتعرف على الأشكال الأساسية (دائرة، مربع)',
                                style: AppFonts.body3(color: NewColors.body),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'يتفاعل مع القصص القصيرة ويجيب على الأسئلة البسيطة',
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
              title: 'ملاحظات المعلمة العامة',
              note:
                  'الطفل أبدى تحسنًا ملحوظًا في التواصل مع زملائه والانخراط في الأنشطة الجماعية. ننصح بمواصلة دعم مهاراته اللغوية من خلال التحدث معه في المنزل وقراءة القصص',
            ),
          ],
        ),
      ),
    );
  }
}
