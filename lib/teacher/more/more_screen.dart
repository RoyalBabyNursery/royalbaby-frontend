import 'package:flutter/material.dart';
import 'package:royalbabyapp/screen/log_in.dart';
import 'package:royalbabyapp/teacher/more/about_us_screen.dart';
import 'package:royalbabyapp/teacher/more/parent_comment.dart';
import 'package:royalbabyapp/teacher/more/profile_screen.dart';
import 'package:royalbabyapp/teacher/more/setting_screen.dart';
import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/theme/fonts.dart';
import 'package:royalbabyapp/widget/container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreState();
}

class _MoreState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.28,
              width: MediaQuery.sizeOf(context).width,
              color: NewColors.grayBox,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).width * 0.18,
                    width: MediaQuery.sizeOf(context).width * 0.18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: NewColors.bg,
                    ),
                    child: Image.asset('assets/images/user.png'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'أ. عبد العزيز مصطفي',
                    style: AppFonts.headingH5(color: NewColors.heading),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'G3, G4, G5, G6',
                    style: AppFonts.body2(color: NewColors.caption),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                    child: HelpForMore(
                      title: 'الملف الشخصي',
                      note: 'عرض وتحديثات معلومات حسابك',
                      image: 'assets/images/User Icon.png',
                    ),
                  ),
                  Divider(height: 1, color: LineColors.line),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ParentComment(),
                        ),
                      );
                    },
                    child: HelpForMore(
                      title: 'تعليقات اولياء الامور',
                      note: 'تعليقات واستفسارات من أولياء الأمور حول أطفالهم',
                      image: 'assets/images/User Icon5.png',
                    ),
                  ),
                  Divider(height: 1, color: LineColors.line),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingScreen()),
                      );
                    },
                    child: HelpForMore(
                      title: 'الاعدادات',
                      note: 'تخصيص تفضيلات التطبيق',
                      image: 'assets/images/setting-2.png',
                    ),
                  ),
                  Divider(height: 1, color: LineColors.line),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutUsScreen(),
                        ),
                      );
                    },
                    child: HelpForMore(
                      title: 'عن التطبيق',
                      note: 'تعرف على مميزات التطبيق وحقوق الاستخدام',
                      image: 'assets/images/information.png',
                    ),
                  ),
                  Divider(height: 1, color: LineColors.line),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LogIn()),
                      );
                    },
                    child: HelpForMore(
                      title: 'تسجيل خروج',
                      note: 'إنهاء الجلسة الحالية بأمان',
                      image: 'assets/images/logout.png',
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.clear();

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogIn(),
                          ),
                          (route) => false,
                        );
                      },
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

class SwitchStudentSheet extends StatelessWidget {
  const SwitchStudentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: const BoxDecoration(
          color: NewColors.alwaysWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      'assets/images/Close Button Container.png',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'تبديل حساب الطالب',
                    style: AppFonts.supHeading2(color: NewColors.heading),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: Container(
                  height: MediaQuery.sizeOf(context).width * 0.116,
                  width: MediaQuery.sizeOf(context).width * 0.116,
                  decoration: BoxDecoration(
                    color: NewColors.lightBG,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/images/user1.png'),
                ),
                title: Text(
                  'احمد ابراهيم عبدالله (G4)',
                  style: AppFonts.body3(color: NewColors.supHeading),
                ),
                subtitle: Text(
                  'حضانة رويال بيبي',
                  style: AppFonts.body3(color: NewColors.body),
                ),
                trailing: Image.asset('assets/images/Student Account.png'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(height: 1, color: LineColors.line),
              ListTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: NewColors.grayBox,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset('assets/images/user1.png'),
                ),
                title: Text(
                  'مريم ابراهيم عبدالله (G2)',
                  style: AppFonts.body3(color: NewColors.supHeading),
                ),
                subtitle: Text(
                  'حضانة رويال بيبي',
                  style: AppFonts.body3(color: NewColors.body),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
