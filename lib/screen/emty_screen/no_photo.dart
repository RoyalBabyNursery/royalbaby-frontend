import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/fonts.dart';

class NoPhoto extends StatefulWidget {
  const NoPhoto({super.key});

  @override
  State<NoPhoto> createState() => _NoNotificationState();
}

class _NoNotificationState extends State<NoPhoto> {
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
                    'الصور والفيدوهات',
                    style: AppFonts.body2(color: NewColors.supHeading),
                  ),
                ],
              ),
              SizedBox(height: 200,),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/PhotoDescription.png',
                      height: MediaQuery.sizeOf(context).width * 0.4,
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'لا توجد وسائط بعد',
                      style: AppFonts.headingH5(color: NewColors.supHeading),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      'لم يتم رفع أي صور أو فيديوهات حتى الآن',
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
