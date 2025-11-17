import 'package:flutter/material.dart';
import 'package:royalbabyapp/teacher/classes/new_class_page.dart';
import 'package:royalbabyapp/teacher/home/home_screen.dart';
import 'package:royalbabyapp/teacher/more/more_screen.dart';
import 'package:royalbabyapp/teacher/photo_video/photo_video.dart';
import 'package:royalbabyapp/teacher/reports/reports_screen.dart';
import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/theme/fonts.dart';

class NaveBar extends StatefulWidget {
  const NaveBar({super.key});

  @override
  State<NaveBar> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<NaveBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    Classes(),
    ReportsScreen(),
    PhotoVideo(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true, // allows navbar to appear elevated over content
        body: SafeArea(child: _pages[_selectedIndex]),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
          decoration: BoxDecoration(
            color: NewColors.alwaysWhite,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 12,
                spreadRadius: 2,
                offset: const Offset(0, -6), // shadow on top side
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent, // to show container color
                elevation:
                    0, // no internal elevation, we’re using custom shadow
                selectedItemColor: NewColors.primary500,
                unselectedItemColor: NewColors.caption,
                selectedLabelStyle: AppFonts.body4(color: NewColors.primary500),
                unselectedLabelStyle: AppFonts.body4(
                  color: NewColors.primary300,
                ),
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/Home.png',
                      width: MediaQuery.sizeOf(context).width * 0.065,
                      height: MediaQuery.sizeOf(context).width * 0.065,
                      color: _selectedIndex == 0
                          ? NewColors.primary500
                          : NewColors.caption,
                    ),
                    label: 'الرئيسيه',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/users.png',
                      width: MediaQuery.sizeOf(context).width * 0.065,
                      height: MediaQuery.sizeOf(context).width * 0.065,
                      color: _selectedIndex == 1
                          ? NewColors.primary500
                          : NewColors.caption,
                    ),
                    label: 'الفصول',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/reports.png',
                      width: MediaQuery.sizeOf(context).width * 0.065,
                      height: MediaQuery.sizeOf(context).width * 0.065,
                      color: _selectedIndex == 2
                          ? NewColors.primary500
                          : NewColors.caption,
                    ),
                    label: 'التقارير',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/album.png',
                      width: MediaQuery.sizeOf(context).width * 0.065,
                      height: MediaQuery.sizeOf(context).width * 0.065,
                      color: _selectedIndex == 3
                          ? NewColors.primary500
                          : NewColors.caption,
                    ),
                    label: 'الألبومات',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/More.png',
                      width: MediaQuery.sizeOf(context).width * 0.065,
                      height: MediaQuery.sizeOf(context).width * 0.065,
                      color: _selectedIndex == 4
                          ? NewColors.primary500
                          : NewColors.caption,
                    ),
                    label: 'المزيد',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
