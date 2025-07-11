import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal/theme/colors.dart';
import 'package:royal/widget/container.dart';

import '../../theme/fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
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
                    'الملف الشخصي',
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
                              'اسم المعلم',
                              style: AppFonts.body3(color: NewColors.caption),
                            ),
                            SizedBox(height: 3,),
                            Text(
                              'عبد العزيز مصطفي',
                              style: AppFonts.supHeading3(
                                  color: NewColors.supHeading),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              ProfileHelp(title: 'رقم الهاتف', note: '+965500012'),
              Divider(
                height: 1,
                color: LineColors.line,
              ),
              ProfileHelp(title: 'الفصول', note: 'G3, G4, G5, G6'),
              Divider(
                height: 1,
                color: LineColors.line,
              ),
              ProfileHelp(title: 'المسمي الوظيفي', note: 'معلم أول'),
              Divider(
                height: 1,
                color: LineColors.line,
              ),
              ProfileHelp(
                  title: 'صلاحيات الحساب',
                  note: 'معلم'),
            ],
          ),
        ),
      ),
    );
  }
}
