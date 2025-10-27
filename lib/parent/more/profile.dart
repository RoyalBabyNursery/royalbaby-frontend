import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/widget/container.dart';

import '../../theme/fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                    'الملف الشخصي',
                    style: AppFonts.body2(color: NewColors.supHeading),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.104,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: NewColors.grayBox,
                  borderRadius: BorderRadius.circular(12),
                ),
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
                      SizedBox(width: 12),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'اسم الطالب',
                              style: AppFonts.body3(color: NewColors.caption),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'احمد ابراهيم عبدالله',
                              style: AppFonts.supHeading3(
                                color: NewColors.supHeading,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              ProfileHelp(title: 'المرحلة', note: 'G4'),
              Divider(height: 1, color: LineColors.line),
              ProfileHelp(title: 'الفصل', note: 'B2'),
              Divider(height: 1, color: LineColors.line),
              ProfileHelp(title: 'الرقم المدني', note: '31505101111'),
              Divider(height: 1, color: LineColors.line),
              ProfileHelp(
                title: 'البريد الإلكتروني (الحضانة)',
                note: 'info@royalbaby.edu.kw',
              ),
              Divider(height: 1, color: LineColors.line),
              ProfileHelp(title: 'كلمة السر', note: 'Ahmed2233'),
              Divider(height: 1, color: LineColors.line),
              ProfileHelp(title: 'رقم هاتف الأب', note: '50001234'),
              Divider(height: 1, color: LineColors.line),
              ProfileHelp(title: 'رقم هاتف الأم', note: '50005678'),
            ],
          ),
        ),
      ),
    );
  }
}
