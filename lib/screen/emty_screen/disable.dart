import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/fonts.dart';

class Disable extends StatefulWidget {
  const Disable({super.key});

  @override
  State<Disable> createState() => _NoNotificationState();
}

class _NoNotificationState extends State<Disable> {
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
                        'assets/images/Disabled Connection 1.png',
                        height: MediaQuery.sizeOf(context).width * 0.4,
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        'لا يوجد اتصال',
                        style: AppFonts.headingH5(color: NewColors.supHeading),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        'تأكد من اتصالك بالإنترنت وأعد المحاولة',
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
