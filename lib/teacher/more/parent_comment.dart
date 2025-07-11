import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal/teacher/reports/choose_stu.dart';
import 'package:royal/teacher/reports/classe_report.dart';
import 'package:royal/teacher/reports/more_reports.dart';
import 'package:royal/theme/colors.dart';
import '../../theme/fonts.dart';
import '../../widget/text-field.dart';

class ParentComment extends StatefulWidget {
  const ParentComment({super.key});

  @override
  State<ParentComment> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ParentComment> {
  int selectedIndex = 0;

  final List<String> tabs = ['الكل', 'تم الرد', 'بانتظار الرد'];
  final List<Widget> pages = [
    Column(
      children: [
        NameTextField(),
        SizedBox(height: 12,),
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: NewColors.lightBG,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: LineColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'assets/images/IMAGE (5).png',
                            height: 36,
                            width: 36,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('آدم محمود علي',
                                  style: AppFonts.caption1(color: NewColors.heading)),
                              const SizedBox(height: 2),
                              Text('17 مايو - 09:22 ص',
                                  style: AppFonts.body4(color: NewColors.body)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8), // مهم لتفصل بين Expanded و Text
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 90), // أو أقل حسب التصميم
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: NewColors.greenBG,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: LineColors.greenStroke),
                            ),
                            child: FittedBox(
                              child: Text('تم الرد',
                                  style: AppFonts.body4(color: NewColors.green)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text('تعليق ولي الأمر',
                        style: AppFonts.body4(color: NewColors.body)),
                    const SizedBox(height: 4),
                    Text('هل ممكن إرسال زجاجة الماء مع آدم يومياً؟',
                        style: AppFonts.caption2(color: NewColors.supHeading)),
                    SizedBox(height: 12,),
                    Divider(
                      height: 1,
                      color: LineColors.line,
                    ),
                    SizedBox(height: 12,),
                    Text('رد الإدارة',
                        style: AppFonts.body4(color: NewColors.body)),
                    const SizedBox(height: 4),
                    Text(
                      'شكرًا على الملاحظة، تم تنبيه المعلمات وسيتم التأكيد يوميًا على وجود الزجاجة مع آدم.',
                      style: AppFonts.caption2(color: NewColors.supHeading),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
    Text('تم الرد'),
    Text('بانتظار الرد'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: SafeArea(
        child: Padding(
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
                    'تعليقات اولياء الامور',
                    style: AppFonts.body2(color: NewColors.supHeading),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(tabs.length, (index) {
                  final isSelected = selectedIndex == index;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? NewColors.primary400
                              : NewColors.alwaysWhite,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: LineColors.line),
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
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Expanded(child: pages[selectedIndex]),
            ],
          ),
        ),
      ),
    );
  }
}
