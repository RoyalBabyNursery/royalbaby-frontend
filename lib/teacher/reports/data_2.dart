import 'package:flutter/material.dart';
import 'package:royalbabyapp/teacher/reports/data_1.dart';
import 'package:royalbabyapp/teacher/reports/data_3.dart';
import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/widget/text-field.dart';

import '../../theme/fonts.dart';

class Data2 extends StatefulWidget {
  const Data2({super.key});

  @override
  State<Data2> createState() => _Data1State();
}

class _Data1State extends State<Data2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
                                'assets/images/Dropdown Icon5.png',
                                height:
                                    MediaQuery.sizeOf(context).width * 0.045,
                                width: MediaQuery.sizeOf(context).width * 0.045,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(width: 18),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                  value: 2 / 5,
                                  strokeWidth: 5,
                                  backgroundColor: LineColors.greenStroke,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    NewColors.green,
                                  ),
                                ),
                              ),
                              Text(
                                '2 من 5',
                                style: AppFonts.supHeading4(
                                  color: NewColors.green,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'تناول الحليب',
                                style: AppFonts.headingH4(
                                  color: NewColors.heading,
                                ),
                              ),
                              Text(
                                'سجّل أوقات شرب الطفل للحليب والكمية',
                                style: AppFonts.body3(color: NewColors.body),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Text(
                        'متى شرب الطفل الحليب؟ (المرة الأولى)',
                        style: AppFonts.body2(color: NewColors.label),
                      ),
                      SizedBox(height: 8),
                      TimeInputField(
                        onTap: () async {
                          TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (picked != null) {}
                        },
                      ),
                      SizedBox(height: 12),
                      Text(
                        'ما كمية الحليب التي شربها؟ (بالمليلتر)',
                        style: AppFonts.body2(color: NewColors.label),
                      ),
                      SizedBox(height: 8),
                      QuantityTextField(controller: TextEditingController()),
                      SizedBox(height: 12),
                      Text(
                        'متى شرب الطفل الحليب؟ (المرة الثانية)',
                        style: AppFonts.body2(color: NewColors.label),
                      ),
                      SizedBox(height: 8),
                      TimeInputField(
                        onTap: () async {
                          TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (picked != null) {}
                        },
                      ),
                      SizedBox(height: 12),
                      Text(
                        'ما كمية الحليب التي شربها؟ (بالمليلتر)',
                        style: AppFonts.body2(color: NewColors.label),
                      ),
                      SizedBox(height: 8),
                      QuantityTextField(controller: TextEditingController()),
                      SizedBox(height: 12),
                      Text(
                        'متى شرب الطفل الحليب؟ (المرة الثالثة)',
                        style: AppFonts.body2(color: NewColors.label),
                      ),
                      SizedBox(height: 8),
                      TimeInputField(
                        onTap: () async {
                          TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (picked != null) {}
                        },
                      ),
                      SizedBox(height: 12),
                      Text(
                        'ما كمية الحليب التي شربها؟ (بالمليلتر)',
                        style: AppFonts.body2(color: NewColors.label),
                      ),
                      SizedBox(height: 8),
                      QuantityTextField(controller: TextEditingController()),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Data3()),
                        );
                      },
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.057,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          color: NewColors.primary500,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'التالي',
                            style: AppFonts.buttonLg(
                              color: NewColors.alwaysWhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Data1()),
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
                            style: AppFonts.buttonLg(
                              color: NewColors.primary500,
                            ),
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
