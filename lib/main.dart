import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utaa_ecampus/home.dart';
import 'package:utaa_ecampus/side_menu.dart';
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
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      //home: SideMenu(),
    );
  }
}
