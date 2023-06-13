import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
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
      body: Obx(
        () => TableCalendar(
          firstDay: calendarController.firstDay,
          lastDay: calendarController.lastDay,
          focusedDay: calendarController.focusedDay,
          calendarFormat: calendarController.calendarFormat,
          selectedDayPredicate: (day) {
            // Use `selectedDayPredicate` to determine which day is currently selected.
            // If this returns true, then `day` will be marked as selected.

            // Using `isSameDay` is recommended to disregard
            // the time-part of compared DateTime objects.
            return isSameDay(calendarController.selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(calendarController.selectedDay, selectedDay)) {
              calendarController.selectedDay = selectedDay;
              calendarController.focusedDay = focusedDay;
            }
          },
          onFormatChanged: (format) {
            if (calendarController.calendarFormat != format) {
              calendarController.calendarFormat = format;
            }
          },
          onPageChanged: (focusedDay) {
            // No need to call `setState()` here
            calendarController.focusedDay = focusedDay;
          },
        ),
      ),
    );
  }
}
