import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:utaa_ecampus/src/controllers/info_controller.dart';
import 'package:utaa_ecampus/src/controllers/main_controller.dart';
import 'package:utaa_ecampus/src/screens/ringinfo/ringinfo_screen.dart';
import 'package:utaa_ecampus/src/screens/calendar/calendar_screen.dart';
import 'package:utaa_ecampus/src/screens/home/home_screen.dart';
import 'package:utaa_ecampus/src/screens/profile/profile_screen.dart';
import 'package:utaa_ecampus/src/screens/studentcard/studentcard_screen.dart';

class MainScreen extends StatelessWidget {
  final MainController mainController = Get.put(MainController());
  final InfoController infoController = Get.put(InfoController());
  MainScreen({super.key});
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
      StudentCardScreen(),
      RingInfoScreen(),
      HomeScreen(),
      CalendarScreen(),
      ProfileScreen(),
    ];

    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            appBar: appBar(),
            extendBody: true,
            bottomNavigationBar: Obx(() => navBar(items)),
            body: Obx(() => screens[mainController.index.value]),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 0,
    );
  }

  CurvedNavigationBar navBar(List<Widget> items) {
    return CurvedNavigationBar(
        key: mainController.navigationKey,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 200),
        items: items,
        height: 50,
        index: mainController.index.value,
        onTap: (index) => mainController.index.value = index);
  }
}
