import 'package:flutter/material.dart';
import 'package:royal/teacher/home/home_screen.dart';
import 'package:royal/teacher/nave_bar.dart';
import 'package:royal/theme/colors.dart';
import 'package:royal/theme/fonts.dart';
import 'package:royal/widget/text-field.dart';

import '../parent/choose_kid.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController civilIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    civilIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppFonts.setWidthFactor(context); // لتفعيل الـ width factor

    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 180),
                Center(
                  child: Image.asset(
                    'assets/images/royal baby logo.png',
                    height: MediaQuery.sizeOf(context).width*0.2,
                    width: MediaQuery.sizeOf(context).width*0.2,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'تسجيل الدخول',
                    style: AppFonts.headingH4(color: NewColors.textHeading),
                  ),
                ),
                const SizedBox(height: 8),
        
                /// وصف نصي
                Center(
                  child: Text(
                    'لمتابعة تقدم طفلك والبقاء على اطلاع بجميع أنشطته بسهولة',
                    style: AppFonts.caption1(color: NewColors.caption),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 32),
        
                /// حقل الرقم المدني
                Text(
                  'الرقم المدني',
                  style: AppFonts.body2(color: NewColors.black.withOpacity(0.8)),
                ),
                SizedBox(height: 8),
                CustomTextFieldWidget(
                  labelText: 'ادخل الرقم المدني',
                  controller: civilIdController,
                ),
                const SizedBox(height: 16),
                Text(
                  'كلمة المرور',
                  style: AppFonts.body2(color: NewColors.black.withOpacity(0.8)),
                ),
                const SizedBox(height: 8),
                CustomTextFieldWidget(
                  labelText: '*******',
                  controller: passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 15),
        
                /// زر الدخول
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: NewColors.primary500,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NaveBar()),
                      );
                    },
                    child: Text(
                      'سجل دخول',
                      style: AppFonts.buttonLg(color: NewColors.alwaysWhite),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(' تواجه مشكلة في الدخول ؟',style: AppFonts.caption1(color: NewColors.caption),),
                    SizedBox(width: 5,),
                    Text('تواصل معنا',style: AppFonts.headingH1(color: NewColors.primary500),)
                  ],
                )
              ],
            ),
          ),
      ),
    );
  }
}
