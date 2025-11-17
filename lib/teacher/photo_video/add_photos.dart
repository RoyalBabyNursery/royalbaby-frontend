import 'package:flutter/material.dart';
import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/widget/text-field.dart';

import '../../theme/fonts.dart';
import 'add_photo.dart';

class AddPhotos extends StatefulWidget {
  const AddPhotos({super.key});

  @override
  State<AddPhotos> createState() => _AddPhotosState();
}

class _AddPhotosState extends State<AddPhotos> {
  final TextEditingController civilIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.065),
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
                        const SizedBox(width: 10),
                        Text(
                          'اضافة صور & فيديو',
                          style: AppFonts.body2(color: NewColors.supHeading),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text(
                      'اسم المناسبة',
                      style: AppFonts.body2(color: NewColors.label),
                    ),
                    SizedBox(height: 12),
                    CustomTextFieldWidget(
                      labelText: 'ادخل اسم المناسبة',
                      controller: civilIdController,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'تاريخ المناسبة',
                      style: AppFonts.body2(color: NewColors.label),
                    ),
                    SizedBox(height: 12),
                    CustomTextFieldWidget(
                      labelText: 'اختر التاريخ',
                      controller: civilIdController,
                    ),
                    SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24),
                            ),
                          ),
                          builder: (_) => const UploadOptionsSheet(),
                        );
                      },
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.191,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: NewColors.blueBg,
                          border: Border.all(color: LineColors.blueStroke),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 32),
                            Image.asset(
                              'assets/images/Upload Instructions.png',
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'اضغط للتحميل',
                              style: AppFonts.supHeading3(
                                color: NewColors.blue,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'JPG, PNG, MP4, MP3',
                              style: AppFonts.body4(color: NewColors.caption),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.065),

            Container(
              height: MediaQuery.sizeOf(context).height * 0.057,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: NewColors.primary500,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'رفع',
                  style: AppFonts.buttonLg(color: NewColors.alwaysWhite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UploadOptionsSheet extends StatelessWidget {
  const UploadOptionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: NewColors.alwaysWhite, // ✳️ غيّر اللون من هنا حسب ما تحب
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                    'نوع الملف',
                    style: AppFonts.supHeading2(color: NewColors.heading),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ListTile(
                title: Text(
                  'التقاط صورة & فيديو',
                  style: AppFonts.body2(color: NewColors.blue),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddPhoto()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'فتح المعرض',
                  style: AppFonts.body2(color: NewColors.blue),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'رفع ملف',
                  style: AppFonts.body2(color: NewColors.blue),
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
