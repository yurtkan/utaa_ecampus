import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:utaa_ecampus/screens/calendar/calendar_screen.dart';
import 'package:utaa_ecampus/screens/home/home_screen.dart';
import 'package:utaa_ecampus/screens/notifications/notifications_screen.dart';
import 'package:utaa_ecampus/screens/profile/profile_screen.dart';

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
        Icons.notifications,
        size: 30,
      ),
      Icon(
        Icons.add,
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
      const NotificationsScreen(),
      const HomeScreen(),
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
            extendBody: true,
            bottomNavigationBar: CurvedNavigationBar(
              key: navigationKey,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 300),
              items: items,
              height: 60,
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
