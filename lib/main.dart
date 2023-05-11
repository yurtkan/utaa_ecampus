import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utaa_ecampus/testpage.dart';
//import '../screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTAA eCampus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // appBarTheme: const AppBarTheme(
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarColor: Colors.transparent,
        //     systemStatusBarContrastEnforced: false,
        //     systemNavigationBarColor: Colors.transparent,
        //     systemNavigationBarContrastEnforced: false,
        //   ),
        // ),
      ),
      debugShowCheckedModeBanner: false,
      home: const TestPage(),
      //home: SideMenu(),
    );
  }
}
