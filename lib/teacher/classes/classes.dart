import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal/teacher/classes/classe_detils.dart';
import 'package:royal/theme/colors.dart';

import '../../theme/fonts.dart';

class Classes extends StatefulWidget {
  const Classes({super.key});

  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 12,),
            Row(
              children: [
                Text('فصولي الدراسية',style: AppFonts.headingH4(color: NewColors.heading),),
                SizedBox(width: 4,),
                Text('(4)',style: AppFonts.body2(color: NewColors.body),),
              ],
            ),
            SizedBox(height: 24,),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ClasseDetils()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: NewColors.lightBG,
                        borderRadius: BorderRadius.circular(8),
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
                                          'assets/images/userss.png'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text('الاكتشاف',
                                                  style: AppFonts.headingH6(
                                                      color: NewColors.heading)),
                                              SizedBox(width: 4,),
                                              Text('(G4)',
                                                  style: AppFonts.body3(
                                                      color: NewColors.body)),
                                            ],
                                          ),
                                          SizedBox(height: 4),
                                          Text('15 طالب',
                                              style: AppFonts.body4(
                                                  color: NewColors.body)),
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
    );
  }
}
