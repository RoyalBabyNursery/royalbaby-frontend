import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:royalbabyapp/riverpod_prov.dart';
import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/theme/fonts.dart';

import 'more/more.dart';
import 'notifications.dart';
import 'services/services.dart';

class MainNavigation extends ConsumerStatefulWidget {
  const MainNavigation({super.key});

  @override
  ConsumerState<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends ConsumerState<MainNavigation> {
  int _selectedIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = const [
      Services(),
      Notifications(),
      More(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedKid = ref.watch(selectedKidProvider);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: _pages[_selectedIndex],
        ),
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
                'assets/images/Menu.png',
                width: MediaQuery.sizeOf(context).width * 0.065,
                height: MediaQuery.sizeOf(context).width * 0.065,
                color: _selectedIndex == 1
                    ? NewColors.primary500
                    : NewColors.caption,
              ),
              label: 'الخدمات',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/Notification.png',
                width: MediaQuery.sizeOf(context).width * 0.065,
                height: MediaQuery.sizeOf(context).width * 0.065,
                color: _selectedIndex == 2
                    ? NewColors.primary500
                    : NewColors.caption,
              ),
              label: 'الاشعارات',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/More.png',
                width: MediaQuery.sizeOf(context).width * 0.065,
                height: MediaQuery.sizeOf(context).width * 0.065,
                color: _selectedIndex == 3
                    ? NewColors.primary500
                    : NewColors.caption,
              ),
              label: 'المزيد',
            ),
          ],
        ),
      ),
    );
  }
}
