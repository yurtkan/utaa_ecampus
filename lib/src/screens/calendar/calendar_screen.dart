import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utaa_ecampus/src/controllers/calendar_controller.dart';

class CalendarScreen extends StatelessWidget {
  final CalendarController calendarController = Get.put(CalendarController());

  CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Calendar',
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Placeholder(),
    );
  }
}
