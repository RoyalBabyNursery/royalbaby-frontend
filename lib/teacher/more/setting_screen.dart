import 'package:flutter/material.dart';
import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/theme/fonts.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String _selectedLanguage = 'العربية';
  String _selectedTheme = 'النظام';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      appBar: AppBar(
        backgroundColor: NewColors.alwaysWhite,
        elevation: 0,
        surfaceTintColor: NewColors.alwaysWhite,
        title: Text(
          'الإعدادات',
          style: AppFonts.headingH4(color: NewColors.heading),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: InkWell(
              onTap: () => _showLanguageSheet(context),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).width * 0.1,
                    width: MediaQuery.sizeOf(context).width * 0.1,
                    decoration: BoxDecoration(
                      color: NewColors.grayBox,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.language, color: NewColors.primary300),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'اللغة',
                        style: AppFonts.supHeading(color: NewColors.supHeading),
                      ),
                      SizedBox(height: 8),
                      Text(_selectedLanguage,
                          style: AppFonts.body3(color: NewColors.caption)),
                    ],
                  ),
                  Spacer(),
                  Image.asset('assets/images/Vector.png'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: const Divider(),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: InkWell(
              onTap: () => _showPasswordSheet(context),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).width * 0.1,
                    width: MediaQuery.sizeOf(context).width * 0.1,
                    decoration: BoxDecoration(
                      color: NewColors.grayBox,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.lock, color: NewColors.primary300),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'كلمة المرور',
                        style: AppFonts.supHeading(color: NewColors.supHeading),
                      ),
                      SizedBox(height: 8),
                      Text('تغيير كلمة المرور',
                          style: AppFonts.body3(color: NewColors.caption)),
                    ],
                  ),
                  Spacer(),
                  Image.asset('assets/images/Vector.png'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: const Divider(),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: InkWell(
              onTap: () => _showThemeSheet(context),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).width * 0.1,
                    width: MediaQuery.sizeOf(context).width * 0.1,
                    decoration: BoxDecoration(
                      color: NewColors.grayBox,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                        Icon(Icons.brightness_6, color: NewColors.primary300),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'سمة التطبيق',
                        style: AppFonts.supHeading(color: NewColors.supHeading),
                      ),
                      SizedBox(height: 8),
                      Text(_selectedTheme,
                          style: AppFonts.body3(color: NewColors.caption)),
                    ],
                  ),
                  Spacer(),
                  Image.asset('assets/images/Vector.png'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: const Divider(),
          ),
        ],
      ),
    );
  }

  // ---------------- MODAL SHEETS ----------------

  void _showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: NewColors.alwaysWhite,
      showDragHandle: true,
      context: context,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      // ),
      builder: (context) {
        return _buildOptionSheet(
          title: 'اختر اللغة',
          options: ['العربية', 'English', 'Français'],
          selected: _selectedLanguage,
          onSelect: (value) {
            setState(() => _selectedLanguage = value);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _showPasswordSheet(BuildContext context) {
    final oldPassword = TextEditingController();
    final newPassword = TextEditingController();
    final confirmPassword = TextEditingController();

    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: NewColors.alwaysWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('تغيير كلمة المرور',
                  style: AppFonts.headingH4(color: NewColors.heading)),
              const SizedBox(height: 16),
              TextField(
                controller: oldPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'كلمة المرور الحالية',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: newPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'كلمة المرور الجديدة',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: confirmPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'تأكيد كلمة المرور الجديدة',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Example validation
                  if (newPassword.text != confirmPassword.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('كلمتا المرور غير متطابقتين')),
                    );
                    return;
                  }
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('تم تحديث كلمة المرور بنجاح')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: NewColors.primary500,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: Text(
                  'تحديث',
                  style: AppFonts.buttonLg(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _showThemeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: NewColors.alwaysWhite,
      showDragHandle: true,
      builder: (context) {
        return _buildOptionSheet(
          title: 'اختر سمة التطبيق',
          options: ['النظام', 'فاتح', 'داكن'],
          selected: _selectedTheme,
          onSelect: (value) {
            setState(() => _selectedTheme = value);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  // ---------------- REUSABLE SHEET BUILDER ----------------
  Widget _buildOptionSheet({
    required String title,
    required List<String> options,
    required String selected,
    required Function(String) onSelect,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Wrap(
        children: [
          Center(
              child: Text(title,
                  style: AppFonts.headingH4(color: NewColors.heading))),
          const SizedBox(height: 16),
          ...options.map((option) {
            final isSelected = option == selected;
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(option),
              trailing: isSelected
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : null,
              onTap: () => onSelect(option),
            );
          }),
          // const SizedBox(height: 20),
        ],
      ),
    );
  }
}
