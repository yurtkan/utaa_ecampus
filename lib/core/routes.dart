import 'package:get/get.dart';
import 'package:utaa_ecampus/src/screens/auth/login_screen.dart';
import 'package:utaa_ecampus/src/screens/auth/welcome_screen.dart';
import 'package:utaa_ecampus/src/screens/calendar/calendar_screen.dart';
import 'package:utaa_ecampus/src/screens/campusmap/campusmap_screen.dart';
import 'package:utaa_ecampus/src/screens/contact/contact_screen.dart';
import 'package:utaa_ecampus/src/screens/home/home_screen.dart';
import 'package:utaa_ecampus/src/screens/main_screen.dart';
import 'package:utaa_ecampus/src/screens/meallistscreen/meallist_screen.dart';
import 'package:utaa_ecampus/src/screens/profile/profile_screen.dart';
import 'package:utaa_ecampus/src/screens/ringinfo/ringinfo_screen.dart';
import 'package:utaa_ecampus/src/screens/studentcard/studentcard_screen.dart';
import 'package:utaa_ecampus/src/testpage.dart';

class Routes {
  Routes._();

  static List<GetPage> get routes {
    return [
      GetPage(
        name: '/test',
        page: () => const TestPage(),
      ),
      GetPage(
        name: '/welcome',
        page: () => const WelcomeScreen(),
      ),
      GetPage(
        name: '/login',
        page: () => const LoginScreen(),
      ),
      GetPage(
        name: '/mainscreen',
        page: () => MainScreen(),
      ),
      GetPage(
        name: '/home',
        page: () => HomeScreen(),
      ),
      GetPage(
        name: '/calendar',
        page: () => CalendarScreen(),
      ),
      GetPage(
        name: '/profile',
        page: () => ProfileScreen(),
      ),
      GetPage(
        name: '/ringinfo',
        page: () => const RingInfoScreen(),
      ),
      GetPage(
        name: '/studentcard',
        page: () => StudentCardScreen(),
      ),
      GetPage(
        name: '/meallist',
        page: () => MealListScreen(),
      ),
      GetPage(
        name: '/campusmap',
        page: () => CampusMapScreen(),
      ),
      GetPage(
        name: '/contact',
        page: () => ContactScreen(),
      ),
    ];
  }
}