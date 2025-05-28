import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:royal/teacher/classes/classes.dart';
import 'package:royal/teacher/home/home_screen.dart';
import 'package:royal/teacher/more/more_screen.dart';
import 'package:royal/teacher/photo_video/photo_video.dart';
import 'package:royal/teacher/reports/reports_screen.dart';
import 'package:royal/theme/colors.dart';
import 'package:royal/theme/fonts.dart';


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
        body: SafeArea(child: _pages[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: NewColors.alwaysWhite,
          selectedItemColor: NewColors.primary500,
          unselectedItemColor: NewColors.caption,
          selectedLabelStyle: AppFonts.body4(color: NewColors.primary500),
          unselectedLabelStyle: AppFonts.body4(color: NewColors.primary300),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/Home.png',
                width: MediaQuery.sizeOf(context).width*0.065,
                height: MediaQuery.sizeOf(context).width*0.065,
                color: _selectedIndex == 0 ? NewColors.primary500 : NewColors.caption,
              ),
              label: 'الرئيسيه',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/users.png',
                width: MediaQuery.sizeOf(context).width*0.065,
                height: MediaQuery.sizeOf(context).width*0.065,
                color: _selectedIndex == 1 ? NewColors.primary500 : NewColors.caption,
              ),
              label: 'الفصول',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/reports.png',
                width: MediaQuery.sizeOf(context).width*0.065,
                height: MediaQuery.sizeOf(context).width*0.065,
                color: _selectedIndex == 2 ? NewColors.primary500 : NewColors.caption,
              ),
              label: 'التقارير',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/album.png',
                width: MediaQuery.sizeOf(context).width*0.065,
                height: MediaQuery.sizeOf(context).width*0.065,
                color: _selectedIndex == 1 ? NewColors.primary500 : NewColors.caption,
              ),
              label: 'الألبومات',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/More.png',
                width: MediaQuery.sizeOf(context).width*0.065,
                height: MediaQuery.sizeOf(context).width*0.065,
                color: _selectedIndex == 3 ? NewColors.primary500 : NewColors.caption,
              ),
              label: 'المزيد',
            ),
          ],
        ),

      ),
    );
  }
}
