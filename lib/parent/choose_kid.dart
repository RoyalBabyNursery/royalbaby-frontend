import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/theme/fonts.dart';

import 'home.dart';

class ChooseKid extends StatefulWidget {
  const ChooseKid({super.key});

  @override
  State<ChooseKid> createState() => _ChooseKidState();
}

class _ChooseKidState extends State<ChooseKid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text(
                'اختر الطالب',
                style: AppFonts.headingH4(color: NewColors.heading),
              ),
              const SizedBox(height: 5),
              Text(
                'يرجى اختيار الطالب لعرض بياناته ومتابعة تفاصيله',
                style: AppFonts.caption1(color: NewColors.caption),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 2,
                  separatorBuilder: (_, __) => Divider(
                    height: MediaQuery.sizeOf(context).height * .06,
                    color: LineColors.line,
                    thickness: 1,
                  ),
                  itemBuilder: (context, index) {
                    String name = index == 0
                        ? 'احمد ابراهيم عبدالله'
                        : 'مريم ابراهيم عبدالله';
                    String level = index == 0 ? 'G4' : 'G2';
                    String nursery = 'حضانة رويال بيبي';

                    return InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const MainNavigation()),
                        // );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: MediaQuery.sizeOf(context).width * 0.117,
                              width: MediaQuery.sizeOf(context).width * 0.117,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: NewColors.inputBG,
                              ),
                              padding: const EdgeInsets.all(6),
                              child: Image.asset(
                                'assets/images/Group.png',
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      name,
                                      style: AppFonts.supHeading(
                                          color: NewColors.supHeading),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '($level)',
                                      style:
                                          AppFonts.body3(color: NewColors.body),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  nursery,
                                  style: AppFonts.body3(color: NewColors.body),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            'assets/images/Vector.png',
                            width: MediaQuery.sizeOf(context).width * 0.04,
                            height: MediaQuery.sizeOf(context).width * 0.04,
                            color: Colors.grey, // اختياري
                          ),
                        ],
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
