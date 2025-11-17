import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/widget/container.dart';

import '../../theme/fonts.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
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
                  'عن التطبيق',
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
              ],
            ),
            SizedBox(height: 12),
            AboutHelp(
              title: 'عن تطبيق رويال بيبي',
              notes: [
                'رويال بيبي هو تطبيق مخصص لأولياء الأمور لمتابعة أطفالهم المسجلين في حضانة رويال بيبي بطريقة سهلة وذكية',
                'نهدف إلى توفير تجربة رقمية متكاملة تربط بين الحضانة والأسرة، وتمنح الوالدين اطلاعًا لحظيًا على نشاطات الطفل اليومية، تقدمه التعليمي، وسلامته داخل بيئة آمنة',
              ],
            ),
            AboutHelp(
              title: 'أبرز مزايا التطبيق',
              notes: [
                'متابعة يومية: تقارير عن الأنشطة، الوجبات، النوم، والتقدم السلوكي',
                'إشعارات فورية: حول الحضور والانصراف والملاحظات الخاصة',
                'دردشة آمنة: للتواصل السريع مع إدارة الحضانة',
                'مكتبة الصور: لمشاركة لحظات الطفل الجميلة خلال يومه',
                'تقديم شكاوى أو تقييمات: لتحسين جودة الخدمة والبيئة التعليمية',
              ],
            ),
            AboutHelp(
              title: 'من نحن؟',
              notes: [
                'حضانة رويال بيبي تسعى لتوفير بيئة تعليمية وتربوية محفزة للأطفال، ونؤمن بأن التواصل المستمر بين الأهل وفريق الحضانة هو أساس نمو الطفل بثقة وسعادة',
              ],
            ),
          ],
        ),
      ),
    );
  }
}
