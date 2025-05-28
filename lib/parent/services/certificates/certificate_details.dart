import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal/theme/colors.dart';
import 'package:royal/widget/container.dart';

import '../../../theme/fonts.dart';

class CertificateDetails extends StatefulWidget {
  const CertificateDetails({super.key});

  @override
  State<CertificateDetails> createState() => _CertificateDetailsState();
}

class _CertificateDetailsState extends State<CertificateDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.065,
            ),
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
                SizedBox(
                  width: 10,
                ),
                Text(
                  'تفاصيل الشهادة',
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
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
                      Row(
                        children: [
                          Image.asset('assets/images/certificate.png'),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(' إنجاز الطفل في مرحلة الحضانة',
                                  style: AppFonts.headingH6(
                                      color: NewColors.heading)),
                              SizedBox(height: 4),
                              Text('نوع الشهادة : مشاركة',
                                  style: AppFonts.body4(color: NewColors.body)),
                              Text('مارس 2025',
                                  style: AppFonts.body4(color: NewColors.body)),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Text('التقييم: ممتاز',
                          style: AppFonts.body4(color: NewColors.body)),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset('assets/images/star.png'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TeacherNoteCard(
                title: 'تقييم المعلمة',
                note:
                    'لقد أظهر طفلك تطورًا رائعًا في المشاركة والتفاعل داخل الصف، ونتمنى له المزيد من التقدم'),
            SizedBox(height: 12,),
            Image.asset('assets/images/image.png'),
            Expanded(child: SizedBox()),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: MediaQuery.sizeOf(context).height*0.057,
                    decoration: BoxDecoration(
                      color: NewColors.primary500,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text('تحميل PDF',style: AppFonts.buttonLg(color: NewColors.alwaysWhite),)),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    height: MediaQuery.sizeOf(context).height*0.057,
                    decoration: BoxDecoration(
                      color: NewColors.primary50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text('مشاركه',style: AppFonts.buttonLg(color: NewColors.primary500),)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
