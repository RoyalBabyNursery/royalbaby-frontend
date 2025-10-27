import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:royalbabyapp/parent/home.dart';
import 'package:royalbabyapp/riverpod_prov.dart';
import 'package:royalbabyapp/teacher/home/notifications_screen.dart';
import 'package:royalbabyapp/theme/colors.dart';
import '../../theme/fonts.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // ✅ Correct Riverpod usage — you can now access providers
    final civilId = ref.watch(civilIdProvider);

    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
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
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 👇 Show Civil ID here dynamically
                      Text(
                        civilId != null && civilId.isNotEmpty
                            ? 'اهلا 👋 $civilId'
                            : 'اهلا 👋',
                        style: AppFonts.supHeading(color: NewColors.heading),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'G3, G4, G5, G6',
                        style: AppFonts.caption1(color: NewColors.caption),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NotificationsScreen(),
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
                            'assets/images/Notification (1).png',
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 18,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 1,
                            ),
                            decoration: const BoxDecoration(
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
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: containerField(
                        imagePath: 'assets/images/MedicalReports.png',
                        label: 'تقارير يومية',
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: containerField(
                        imagePath: 'assets/images/ResearchandStudyReport.png',
                        label: 'تقارير فصلية',
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: containerField(
                        imagePath: 'assets/images/Addfilestobigfolder.png',
                        label: 'تقارير اضافية',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: containerField(
                        imagePath: 'assets/images/ClassTimetable.png',
                        label: 'الفصول',
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: containerField(
                        imagePath: 'assets/images/PhotoDescription.png',
                        label: 'الصور والفيدوهات',
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: containerField(
                        imagePath:
                            'assets/images/MarketingMessagesorNotification.png',
                        label: 'تعليقات اولياء الأمور',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget containerField({required String imagePath, required String label}) {
    return Column(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.14,
          width: MediaQuery.sizeOf(context).width * .276,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: NewColors.grayBox,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.19),
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: SizedBox(
              height: 70,
              width: 70,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          label,
          style: AppFonts.body2(color: NewColors.supHeading),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
