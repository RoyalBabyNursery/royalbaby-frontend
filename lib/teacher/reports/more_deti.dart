import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royalbabyapp/teacher/reports/reports_screen.dart';
import 'package:royalbabyapp/theme/colors.dart';

import '../../theme/fonts.dart';
import '../../widget/text-field.dart';
import '../classes/add_event.dart';

class MoreDeti extends StatefulWidget {
  const MoreDeti({super.key});

  @override
  State<MoreDeti> createState() => _MoreDetiState();
}

class _MoreDetiState extends State<MoreDeti> {
  String selectedReportTo = 'الإدارة';
  String? selectedDate;
  String? selectedTime;

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
                          border: Border.all(
                            color: LineColors.border,
                            width: 1,
                          ),
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
                      'انشاء تقرير اضافي',
                      style: AppFonts.body2(color: NewColors.supHeading),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                Text(
                  'نوع التقرير',
                  style: AppFonts.body2(color: NewColors.label),
                ),
                const SizedBox(height: 8),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.057,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: NewColors.inputBG,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: LineColors.inputBorder),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Text(
                          'اختر نوع التقرير',
                          style: AppFonts.body2(color: NewColors.placeHolder),
                        ),
                        const Spacer(),
                        Image.asset('assets/images/Dropdown Icon3.png'),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),
                Text(
                  'ماذا حدث؟ (صف الحالة بإيجاز)',
                  style: AppFonts.body2(color: NewColors.label),
                ),
                const SizedBox(height: 8),
                NoteTextField(),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'تاريخ الواقعة',
                            style: AppFonts.body2(color: NewColors.label),
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () async {
                              DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (picked != null) {
                                setState(() {
                                  selectedDate =
                                      "${picked.day}/${picked.month}/${picked.year}";
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: NewColors.inputBG,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: LineColors.inputBorder,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    selectedDate ?? 'اختر التاريخ',
                                    style: AppFonts.body2(
                                      color: NewColors.placeHolder,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    size: 18,
                                    color: NewColors.placeHolder,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'وقت الواقعة',
                            style: AppFonts.body2(color: NewColors.label),
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () async {
                              TimeOfDay? picked = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (picked != null) {
                                setState(() {
                                  selectedTime = picked.format(context);
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: NewColors.inputBG,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: LineColors.inputBorder,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    selectedTime ?? 'ادخل الوقت',
                                    style: AppFonts.body2(
                                      color: NewColors.placeHolder,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.access_time,
                                    color: NewColors.placeHolder,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Text(
                  'الجهة التي تم إخطارها (اختياري)',
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: ['الإدارة', 'ولي الأمر', 'لم يتم الإبلاغ بعد'].map((
                    option,
                  ) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<String>(
                          value: option,
                          groupValue: selectedReportTo,
                          activeColor: NewColors.primary400,
                          fillColor: WidgetStateProperty.all(
                            LineColors.radioStroke,
                          ),
                          visualDensity: const VisualDensity(
                            horizontal: -4,
                            vertical: -4,
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.values.first,
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => selectedReportTo = value);
                            }
                          },
                        ),
                        Text(
                          option,
                          style: AppFonts.body2(color: NewColors.body),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                SizedBox(height: 18),
                Text(
                  'رفع صورة أو مستند (مثلاً صورة خدش – ورقة تنبيه – تسجيل)',
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      builder: (_) => const UploadOptionsSheet(),
                    );
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.191,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: NewColors.blueBg,
                      border: Border.all(color: LineColors.blueStroke),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 32),
                        Image.asset('assets/images/Upload Instructions.png'),
                        const SizedBox(height: 4),
                        Text(
                          'اضغط للتحميل',
                          style: AppFonts.supHeading3(color: NewColors.blue),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'JPG, PNG, MP4, MP3',
                          style: AppFonts.body4(color: NewColors.caption),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  'ملاحظات إضافية (اختياري)',
                  style: AppFonts.body2(color: NewColors.label),
                ),
                SizedBox(height: 8),
                NoteTextField(),
                SizedBox(height: 48),
                InkWell(
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
                              color: NewColors.green,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'تم بنجاح',
                                    style: AppFonts.supHeading4(
                                      color: NewColors.supHeading,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'تم انشاء التقرير الاضافي للطفل',
                                    style: AppFonts.caption2(
                                      color: NewColors.caption,
                                    ),
                                  ),
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
                          builder: (context) => const ReportsScreen(),
                        ),
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
                        style: AppFonts.buttonLg(color: NewColors.alwaysWhite),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
