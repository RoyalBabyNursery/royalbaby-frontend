import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royalbabyapp/theme/colors.dart';

import '../../theme/fonts.dart';
import '../../widget/text-field.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({super.key});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  final TextEditingController civilIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
                const SizedBox(width: 10),
                Text(
                  'اضافة صور & فيديو',
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text('اسم المناسبة', style: AppFonts.body2(color: NewColors.label)),
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
            Expanded(
              child: ListView.separated(
                itemCount: 2,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: NewColors.blueBg,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: LineColors.blueStroke),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/images/Image (1).png'),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '100043.JPG',
                                          style: AppFonts.supHeading3(
                                            color: NewColors.blue,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '342.KP',
                                          style: AppFonts.body4(
                                            color: NewColors.caption,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Image.asset('assets/images/Trash1.png'),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 12),
            Text(
              'اضف ملفات اخري',
              style: AppFonts.supHeading3(color: NewColors.blue),
            ),
            SizedBox(height: 24),
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
