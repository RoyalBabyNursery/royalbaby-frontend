import 'package:flutter/material.dart';
import 'package:royalbabyapp/parent/services/academic_calendar/academic_calendar.dart';
import 'package:royalbabyapp/parent/services/daily_schedule/daily_schedule.dart';
import 'package:royalbabyapp/parent/services/payments/payments.dart';
import 'package:royalbabyapp/parent/services/reports/reports.dart';
import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/theme/fonts.dart';

import 'advertisements.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: NewColors.alwaysWhite,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).width * 0.117,
                      width: MediaQuery.sizeOf(context).width * 0.117,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: NewColors.inputBG,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Image.asset('assets/images/Group.png'),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'احمد ابراهيم عبدالله',
                          style: AppFonts.supHeading(color: NewColors.heading),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'G4',
                          style: AppFonts.caption1(color: NewColors.caption),
                        ),
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Advertisements(),
                          ),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            height: MediaQuery.sizeOf(context).width * 0.117,
                            width: MediaQuery.sizeOf(context).width * 0.117,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: NewColors.alwaysWhite,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: Image.asset(
                              'assets/images/announcements.png',
                            ),
                          ),
                          Positioned(
                            top: 2,
                            left: 2,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color: NewColors.primary400,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '4',
                                style: AppFonts.body5(
                                  color: NewColors.alwaysWhite,
                                ).copyWith(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'استكشف الخدمات',
                      style: AppFonts.headingH6(color: NewColors.heading),
                    ),
                    Spacer(),
                    Text(
                      'عرض الكل',
                      style: AppFonts.body3(color: NewColors.body),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Payments(),
                            ),
                          );
                        },
                        child: containerField(
                          imagePath: 'assets/images/Paymentfailed.png',
                          label: 'المدفوعات',
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Reports(),
                            ),
                          );
                        },
                        child: containerField(
                          imagePath: 'assets/images/MedicalReports.png',
                          label: 'التقارير',
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DailySchedule(),
                            ),
                          );
                        },
                        child: containerField(
                          imagePath: 'assets/images/ScheduleMeeting.png',
                          label: 'الجدول اليومي',
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AcademicCalendar(),
                            ),
                          );
                        },
                        child: containerField(
                          imagePath: 'assets/images/Conditionofschool.png',
                          label: 'التقويم الدراسي',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'الاشعارات',
                      style: AppFonts.headingH6(color: NewColors.heading),
                    ),
                    Spacer(),
                    Text(
                      'عرض الكل',
                      style: AppFonts.body3(color: NewColors.body),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(1),
                    itemCount: 5,
                    separatorBuilder: (_, __) => const Divider(
                      color: LineColors.line,
                      thickness: 1,
                      height: 25,
                    ),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Image.asset(
                            'assets/images/notification1.png',
                            height: MediaQuery.sizeOf(context).width * 0.065,
                            width: MediaQuery.sizeOf(context).width * 0.065,
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الواجب الأول في الفتره الثانية',
                                style: AppFonts.supHeading4(
                                  color: NewColors.supHeading,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'اليوم 11:00ص',
                                style: AppFonts.body4(color: NewColors.body),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/Vector.png',
                            height: MediaQuery.sizeOf(context).width * 0.065,
                            width: MediaQuery.sizeOf(context).width * 0.065,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget containerField({required String imagePath, required String label}) {
    return Column(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * .1,
          width: MediaQuery.sizeOf(context).width * .2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: NewColors.grayBox,
          ),
          padding: const EdgeInsets.all(6),
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: AppFonts.body4(color: NewColors.supHeading),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
