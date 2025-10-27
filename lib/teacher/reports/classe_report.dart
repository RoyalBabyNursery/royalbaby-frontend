import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royalbabyapp/theme/colors.dart';

import '../../theme/fonts.dart';
import '../../widget/text-field.dart';

class ClasseReport extends StatefulWidget {
  const ClasseReport({super.key});

  @override
  State<ClasseReport> createState() => _ChooseStuState();
}

class _ChooseStuState extends State<ClasseReport> {
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
                  const SizedBox(width: 10),
                  Text(
                    'اختر الطالب',
                    style: AppFonts.body2(color: NewColors.supHeading),
                  ),
                ],
              ),
              SizedBox(height: 36),
              NameTextField(),
              SizedBox(height: 18),
              Expanded(
                child: ListView.separated(
                  itemCount: 7,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Classe1(),
                        //   ),
                        // );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: NewColors.lightBG,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: LineColors.border),
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
                                        Image.asset(
                                          'assets/images/IMAGE (2).png',
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'آدم محمود علي',
                                              style: AppFonts.caption1(
                                                color: NewColors.heading,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              '3 سنوات',
                                              style: AppFonts.body4(
                                                color: NewColors.body,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Image.asset('assets/images/Vector.png'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
