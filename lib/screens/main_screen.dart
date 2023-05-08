import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:utaa_ecampus/screens/ringinfo/ringinfo_screen.dart';
import 'package:utaa_ecampus/screens/calendar/calendar_screen.dart';
import 'package:utaa_ecampus/screens/home/home_screen.dart';
import 'package:utaa_ecampus/screens/profile/profile_screen.dart';
import 'package:utaa_ecampus/screens/studentcard/studentcard_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;
  @override
  Widget build(BuildContext context) {
    const items = <Widget>[
      Icon(
        Icons.badge,
        size: 30,
      ),
      Icon(
        Icons.departure_board,
        size: 30,
      ),
      Icon(
        Icons.home,
        size: 30,
      ),
      Icon(
        Icons.calendar_month,
        size: 30,
      ),
      Icon(
        Icons.account_circle,
        size: 30,
      ),
    ];

    final screens = [
      const StudentCardScreen(),
      const RingInfoScreen(),
      const HomeScreen(),
      const CalendarScreen(),
      const ProfileScreen(),
    ];

    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.white,
                systemNavigationBarColor: Colors.white,
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              toolbarHeight: 0,
            ),
            extendBody: true,
            bottomNavigationBar: CurvedNavigationBar(
              key: navigationKey,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 200),
              items: items,
              height: 50,
              index: index,
              onTap: (index) => setState(() => this.index = index),
            ),
            body: screens[index],
          ),
        ),
      ),
    );
  }
}
