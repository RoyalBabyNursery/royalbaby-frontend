import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal/theme/colors.dart';
import 'package:royal/widget/container.dart';

import '../../theme/fonts.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.07,
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
                  'الاسئله الشائعة',
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
              ],
            ),
            SizedBox(height: 12,),
            FaqHelp(title: 'نسيت كلمة المرور، ماذا أفعل؟',  ),
            Divider(
              height: 1,
              color: LineColors.line,
            ),
            FaqHelp(title: 'كيف يمكنني متابعة نشاط طفلي داخل الحضانة؟'),
            Divider(
              height: 1,
              color: LineColors.line,
            ),
            FaqHelp(title: 'هل يمكنني التواصل مع إدارة الحضانة مباشرة من التطبيق؟'),
            Divider(
              height: 1,
              color: LineColors.line,
            ),
            FaqHelp(title: 'ظهرت لي رسالة "الطفل مسجل بالفعل ولا يمكن تسجيل الدخول"؟')
          ],
        ),
      ),
    );
  }
}
