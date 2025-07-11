import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal/teacher/reports/data_1.dart';
import 'package:royal/teacher/reports/data_3.dart';
import 'package:royal/teacher/reports/data_4.dart';
import 'package:royal/teacher/reports/reports_screen.dart';
import 'package:royal/theme/colors.dart';
import 'package:royal/widget/text-field.dart';

import '../../theme/fonts.dart';

class Data5 extends StatefulWidget {
  const Data5({super.key});

  @override
  State<Data5> createState() => _Data1State();
}

class _Data1State extends State<Data5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: SafeArea(
        child: Column(
          children: [
            // الجزء القابل للتمرير
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              border: Border.all(
                                  color: LineColors.border, width: 1),
                            ),
                            child: Image.asset(
                              'assets/images/Dropdown Icon5.png',
                              height: MediaQuery.sizeOf(context).width * 0.045,
                              width: MediaQuery.sizeOf(context).width * 0.045,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 18),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator(
                                value: 5 / 5,
                                strokeWidth: 5,
                                backgroundColor: LineColors.greenStroke,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    NewColors.green),
                              ),
                            ),
                            Text(
                              '5 من 5',
                              style:
                                  AppFonts.supHeading4(color: NewColors.green),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ملاحظات إضافية',
                              style:
                                  AppFonts.headingH4(color: NewColors.heading),
                            ),
                            Text(
                              'اكتب ملاحظة بخصوص الطفل (اختياري)',
                              style: AppFonts.body3(color: NewColors.body),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'هل لديك ملاحظات إضافية بخصوص الطفل اليوم؟',
                      style: AppFonts.body2(color: NewColors.label),
                    ),
                    const SizedBox(height: 8),
                    NoteTextField(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            duration: const Duration(seconds: 2),
                            content: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: NewColors.grayBox,
                                border: Border.all(
                                    color: NewColors.green, width: 2),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.green,
                                    child: Icon(Icons.check,
                                        color: Colors.white, size: 18),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('تم بنجاح',
                                          style: AppFonts.supHeading4(
                                              color: NewColors.supHeading)),
                                      const SizedBox(height: 4),
                                      Text('تم حفظ تقرير اليوم لطفل الروضة',
                                          style: AppFonts.caption2(
                                              color: NewColors.caption)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ReportsScreen()),
                          );
                        });
                      },
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.057,
                        decoration: BoxDecoration(
                          color: NewColors.primary500,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'انشاء التقرير',
                            style:
                                AppFonts.buttonLg(color: NewColors.alwaysWhite),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Data4()),
                        );
                      },
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.057,
                        decoration: BoxDecoration(
                          color: NewColors.primary50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'السابق',
                            style:
                                AppFonts.buttonLg(color: NewColors.primary500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
