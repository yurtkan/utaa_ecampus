import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatelessWidget {
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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: SfCalendar(
          view: CalendarView.month,
          firstDayOfWeek: 1,
          monthViewSettings: MonthViewSettings(showAgenda: true),
        ),
      ),
    );
  }
}
