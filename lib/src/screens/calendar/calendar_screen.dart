import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:utaa_ecampus/src/controllers/calendar_controller.dart';
import 'package:utaa_ecampus/src/controllers/main_controller.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({super.key});
  final MainController mainController = Get.put(MainController());
  final MyCalendarController calendarController =
      Get.put(MyCalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          automaticallyImplyLeading: false,
          elevation: 1,
          centerTitle: true,
          title: const Text(
            'Calendar',
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Obx(
        () => mainController.isGuest.value == true
            ? guestCalendar()
            : userCalendar(),
      ),
    );
  }

  SizedBox guestCalendar() {
    return const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.cancel,
            color: Colors.red,
            size: 100,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'You are not logged in!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Please login to view Calendar.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Padding userCalendar() {
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * 0.06),
      child: SfCalendar(
        view: CalendarView.month,
        firstDayOfWeek: 1,
        initialDisplayDate: DateTime.now(),
        initialSelectedDate: DateTime.now(),
        showNavigationArrow: true,
        showCurrentTimeIndicator: true,
        minDate: DateTime.now().add(
          Duration(
            days: -(DateTime.now().day - 1),
          ),
        ),
        maxDate: DateTime.now().add(
          Duration(
            days: 60 + DateTime.now().day,
          ),
        ),
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          showAgenda: true,
        ),
        dataSource: _getDataSource(),
      ),
    );
  }

  _DataSource _getDataSource() {
    return _DataSource(calendarController.appointmentsData);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
