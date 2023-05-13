import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utaa_ecampus/screens/home/home_screen.dart';
import 'package:utaa_ecampus/screens/notfoundscreen/not_found_screen.dart';
import 'package:utaa_ecampus/testpage.dart';
import 'package:get/get.dart';

void main() {
  //runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      GetMaterialApp(
        title: 'UTAA eCampus',
        debugShowCheckedModeBanner: false,
        //home: TestPage(),
        unknownRoute: GetPage(name: '/notfound', page: () => NotFoundScreen()),
        initialRoute: '/test',
        getPages: [
          GetPage(
            name: '/test',
            page: () => TestPage(),
          ),
          GetPage(
            name: '/home',
            page: () => HomeScreen(),
          ),
        ],
      ),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'UTAA eCampus',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         // appBarTheme: const AppBarTheme(
//         //   systemOverlayStyle: SystemUiOverlayStyle(
//         //     statusBarColor: Colors.transparent,
//         //     systemStatusBarContrastEnforced: false,
//         //     systemNavigationBarColor: Colors.transparent,
//         //     systemNavigationBarContrastEnforced: false,
//         //   ),
//         // ),
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const TestPage(),
//       //home: SideMenu(),
//     );
//   }
// }
