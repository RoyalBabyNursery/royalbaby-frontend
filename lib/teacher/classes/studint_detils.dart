import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal/theme/colors.dart';
import 'package:royal/widget/container.dart';
import 'package:royal/widget/text-field.dart';

import '../../theme/fonts.dart';

class StudintDetils extends StatefulWidget {
  const StudintDetils({super.key});

  @override
  State<StudintDetils> createState() => _TeacherDetilsState();
}

class _TeacherDetilsState extends State<StudintDetils> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: SafeArea(
        child: SingleChildScrollView(
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
                      'صفحة الطالب',
                      style: AppFonts.body2(color: NewColors.supHeading),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.104,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      color: NewColors.grayBox,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).width * 0.116,
                          width: MediaQuery.sizeOf(context).width * 0.116,
                          decoration: BoxDecoration(
                            color: NewColors.bg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset('assets/images/user1.png'),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'آدم محمود علي',
                                style: AppFonts.supHeading3(
                                    color: NewColors.supHeading),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'ذكر',
                                style: AppFonts.body3(color: NewColors.caption),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'البيانات الأساسية',
                  style: AppFonts.supHeading3(color: NewColors.supHeading),
                ),
                SizedBox(
                  height: 12,
                ),
                InfoRow(
                  label: 'تاريخ الميلاد',
                  value: '١٥ مارس ٢٠٢٠',
                  valueColor: NewColors.supHeading,
                ),
                SizedBox(
                  height: 12,
                ),
                InfoRow(
                  label: 'العمر',
                  value: '٤ سنوات و٢ شهر',
                  valueColor: NewColors.supHeading,
                ),
                SizedBox(
                  height: 12,
                ),
                InfoRow(
                  label: 'فصله الدراسي',
                  value: 'الاكتشاف',
                  valueColor: NewColors.supHeading,
                ),
                SizedBox(
                  height: 12,
                ),
                InfoRow(
                  label: 'الرقم التسلسلي',
                  value: 'RB-202045',
                  valueColor: NewColors.supHeading,
                ),
                SizedBox(
                  height: 24,
                ),
                Divider(
                  height: 1,
                  color: LineColors.line,
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'الحالة الصحية',
                  style: AppFonts.supHeading3(color: NewColors.supHeading),
                ),
                SizedBox(
                  height: 12,
                ),
                InfoText(label: 'حساسية خفيفة من الحليب'),
                SizedBox(
                  height: 12,
                ),
                InfoText(label: 'تم تسليم تقرير طبي موثق'),
                SizedBox(
                  height: 12,
                ),
                InfoText(
                    label:
                        'ملاحظة من الإدارة: لا يُفضل تقديم منتجات ألبان بدون إشراف'),
                SizedBox(
                  height: 24,
                ),
                Divider(
                  height: 1,
                  color: LineColors.line,
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'سجل الحضور',
                  style: AppFonts.supHeading3(color: NewColors.supHeading),
                ),
                SizedBox(
                  height: 12,
                ),
                InfoRow(
                    label: '١٧ مايو', value: 'حاضر', valueColor: NewColors.green),
                SizedBox(
                  height: 12,
                ),
                InfoRow(
                    label: '١٦ مايو', value: 'حاضر', valueColor: NewColors.green),
                SizedBox(
                  height: 12,
                ),
                InfoRow(
                    label: '١٥ مايو',
                    value: 'غائب (سبب صحي)',
                    valueColor: NewColors.red),
                SizedBox(
                  height: 12,
                ),
                InfoRow(
                    label: '١٤ مايو', value: 'حاضر', valueColor: NewColors.green),
                SizedBox(
                  height: 24,
                ),
                Divider(
                  height: 1,
                  color: LineColors.line,
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'السلوك والتفاعل',
                  style: AppFonts.supHeading3(color: NewColors.supHeading),
                ),
                SizedBox(
                  height: 12,
                ),
                InfoText(label: '١٧ مايو: هادئ ومتفاعل مع النشاط الفني'),
                SizedBox(
                  height: 12,
                ),
                InfoText(label: '١٥ مايو: لم يحضر'),
                SizedBox(
                  height: 12,
                ),
                InfoText(label: '١٤ مايو: ساعد زملاءه في الترتيب'),
                SizedBox(
                  height: 12,
                ),
                InfoText(
                    label:
                        'ملاحظات خاصة: يظهر انزعاجًا طفيفًا في وقت النوم، تمت متابعته'),
                SizedBox(
                  height: 24,
                ),
                Divider(
                  height: 1,
                  color: LineColors.line,
                ),
                SizedBox(
                  height: 24,
                ),
                TeacherNoteCard(
                    title: 'تعليقات ولي الأمر',
                    note:
                        '•   ١٢ مايو: هل من الممكن التذكير بزجاجة الماء يوميًا؟'),
                SizedBox(
                  height: 24,
                ),
                Divider(
                  height: 1,
                  color: LineColors.line,
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: NewColors.lightBG.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: LineColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ملاحظات إدارية',
                          style:
                              AppFonts.supHeading3(color: NewColors.supHeading)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('•  لا توجد ملاحظات حرجة)',
                                style: AppFonts.body3(color: NewColors.body)),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                                '•  تم تأكيد تحديث الملف الصحي من ولي الأمر',
                                style: AppFonts.body3(color: NewColors.body)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
