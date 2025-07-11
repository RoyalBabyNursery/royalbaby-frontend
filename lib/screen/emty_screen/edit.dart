import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/fonts.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _NoNotificationState();
}

class _NoNotificationState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 200,),
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/systemintallation.png',
                        height: MediaQuery.sizeOf(context).width * 0.4,
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        'نقوم ببعض أعمال الصيانة',
                        style: AppFonts.headingH5(color: NewColors.supHeading),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        'نعتذر عن الإزعاج المؤقت. التطبيق سيعود للعمل قريبًا',
                        style: AppFonts.body3(color: NewColors.body),
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
