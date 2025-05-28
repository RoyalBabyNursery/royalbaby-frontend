import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal/theme/colors.dart';
import 'package:royal/widget/container.dart';

import '../../theme/fonts.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
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
                  'الاعدادات' ,
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
              ],
            ),
            SizedBox(height: 24,),
            SettingHelp(
              title: 'اللغة',
              note: 'العربية',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  builder: (_) => const LanguageBottomSheet(),
                );
              },
            ),
            Divider(height: 1, color: LineColors.line),

            SettingHelp(
              title: 'كلمة المرور',
              note: 'تغيير',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  builder: (_) => const PasswordBottomSheet(),
                );
              },
            ),
            Divider(height: 1, color: LineColors.line),

            SettingHelp(
              title: 'ثيم التطبيق',
              note: 'فاتح',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  builder: (_) => const ThemeBottomSheet(),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}


class LanguageBottomSheet extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;

  const LanguageBottomSheet({
    super.key,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        color: backgroundColor ?? NewColors.alwaysWhite,
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset('assets/images/Close Button Container.png'),
              Text(
                'تغيير اللغه',
                style: AppFonts.supHeading2(color: textColor ?? NewColors.heading),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Image.asset('assets/images/Reward Points Label.png'),
            title: Text('العربية', style: AppFonts.body1(color: NewColors.supHeading)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Image.asset('assets/images/Reward Points Label2.png'),
            title: Text('English', style: AppFonts.body1(color: NewColors.supHeading)),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class PasswordBottomSheet extends StatefulWidget {
  final Color? backgroundColor;
  final Color? textColor;

  const PasswordBottomSheet({
    super.key,
    this.backgroundColor,
    this.textColor,
  });

  @override
  State<PasswordBottomSheet> createState() => _PasswordBottomSheetState();
}

class _PasswordBottomSheetState extends State<PasswordBottomSheet> {
  bool oldPassVisible = false;
  bool newPassVisible = false;
  bool confirmPassVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? NewColors.alwaysWhite,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  'assets/images/Close Button Container.png',
                  height: 24,
                  width: 24,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'تغيير كلمة المرور',
                style: AppFonts.supHeading2(
                    color: widget.textColor ?? NewColors.heading),
              ),
            ],
          ),
          const SizedBox(height: 20),

          /// كلمة المرور القديمة
          Text('كلمة المرور القديمة', style: AppFonts.body2(color: NewColors.label)),
          const SizedBox(height: 8),
          buildPasswordField(
            isVisible: oldPassVisible,
            onToggle: () => setState(() => oldPassVisible = !oldPassVisible),
          ),
          const SizedBox(height: 16),

          /// كلمة المرور الجديدة
          Text('كلمة المرور الجديدة', style: AppFonts.body2(color: NewColors.label)),
          const SizedBox(height: 8),
          buildPasswordField(
            isVisible: newPassVisible,
            onToggle: () => setState(() => newPassVisible = !newPassVisible),
          ),
          const SizedBox(height: 16),

          /// تأكيد كلمة المرور
          Text('اعادة كلمة المرور الجديدة', style: AppFonts.body2(color: NewColors.label)),
          const SizedBox(height: 8),
          buildPasswordField(
            isVisible: confirmPassVisible,
            onToggle: () => setState(() => confirmPassVisible = !confirmPassVisible),
          ),
          const SizedBox(height: 16),
          Container(
            height: MediaQuery.sizeOf(context).height*0.057,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: NewColors.primary500,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: Text('حفظ',style: AppFonts.buttonLg(color: NewColors.alwaysWhite),)),
          ),
        ],
      ),
    );
  }

  Widget buildPasswordField({
    required bool isVisible,
    required VoidCallback onToggle,
  }) {
    return TextField(
      obscureText: !isVisible,
      decoration: InputDecoration(
        filled: true,
        fillColor: NewColors.inputBG,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: NewColors.caption,
          ),
          onPressed: onToggle,
        ),
      ),
    );
  }
}



class ThemeBottomSheet extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;

  const ThemeBottomSheet({
    super.key,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        color: backgroundColor ?? NewColors.alwaysWhite,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset('assets/images/Close Button Container.png'),
              Text(
                'ثيم التطبيق',
                style: AppFonts.supHeading2(color: textColor ?? NewColors.heading),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Image.asset('assets/images/Reward Points Label3.png'),
            title: Text('الوضع الفاتح', style: AppFonts.body1(color: NewColors.supHeading)),
            onTap: () => Navigator.pop(context),
          ),
          Divider(height: 1, color: LineColors.line),
          ListTile(
            leading: Image.asset('assets/images/Reward Points Label (1).png'),
            title: Text('الوضع الغامق', style: AppFonts.body1(color: NewColors.supHeading)),
            onTap: () => Navigator.pop(context),
          ),
          Divider(height: 1, color: LineColors.line),
          ListTile(
            leading: Image.asset('assets/images/Reward Points Label (2).png'),
            title: Text('الوضع الافتراضي', style: AppFonts.body1(color: NewColors.supHeading)),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

