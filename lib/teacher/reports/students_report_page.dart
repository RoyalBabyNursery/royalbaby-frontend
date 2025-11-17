// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:royalbabyapp/teacher/reports/reports_form_page.dart';

import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../riverpod_prov.dart';

class StudentReportsPage extends ConsumerWidget {
  const StudentReportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendance = ref.watch(attendanceProvider);

    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      appBar: AppBar(
        backgroundColor: NewColors.alwaysWhite,
        automaticallyImplyLeading: false,
        title: Row(
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
            const SizedBox(width: 10),
            Text(
              'تقييم حضور الطالب',
              style: AppFonts.headingH4(color: NewColors.heading),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Question + radio buttons
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'هل حضر الطالب اليوم؟',
                    style: AppFonts.supHeading3(color: NewColors.supHeading),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      // نعم
                      Expanded(
                        child: Row(
                          children: [
                            Radio<bool>(
                              value: true,
                              groupValue: attendance,
                              activeColor: NewColors.primary500,
                              onChanged: (value) {
                                ref.read(attendanceProvider.notifier).state =
                                    value;
                              },
                            ),
                            Text(
                              'نعم',
                              style: AppFonts.body2(color: NewColors.body),
                            ),
                          ],
                        ),
                      ),
                      // لا
                      Expanded(
                        child: Row(
                          children: [
                            Radio<bool>(
                              value: false,
                              groupValue: attendance,
                              activeColor: NewColors.caption,
                              onChanged: (value) {
                                ref.read(attendanceProvider.notifier).state =
                                    value;
                              },
                            ),
                            Text(
                              'لا',
                              style: AppFonts.body2(color: NewColors.body),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            // Start Report button
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: attendance == true
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const StudentReportFormPage(),
                    ),
                  );
                }
              : null, // disabled if not yes
          style: ElevatedButton.styleFrom(
            backgroundColor: NewColors.primary500,
            disabledBackgroundColor: NewColors.primary100,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'ابدأ التقرير',
            style: AppFonts.buttonLg(
              color:
                  attendance == true ? NewColors.alwaysWhite : NewColors.body,
            ),
          ),
        ),
      ),
    );
  }
}
