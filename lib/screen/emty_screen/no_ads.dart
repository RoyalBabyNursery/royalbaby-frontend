import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/fonts.dart';

class NoAds extends StatefulWidget {
  const NoAds({super.key});

  @override
  State<NoAds> createState() => _NoNotificationState();
}

class _NoNotificationState extends State<NoAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
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
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'الإعلانات',
                    style: AppFonts.body2(color: NewColors.supHeading),
                  ),
                ],
              ),
              SizedBox(height: 200,),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/message-notification.png',
                      height: MediaQuery.sizeOf(context).width * 0.4,
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'لا توجد إعلانات',
                      style: AppFonts.headingH5(color: NewColors.supHeading),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      'ستظهر الإعلانات الجديدة الخاصة بالحضانة في هذا القسم',
                      style: AppFonts.body3(color: NewColors.body),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
