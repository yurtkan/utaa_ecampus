// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:utaa_ecampus/src/controllers/main_controller.dart';
import 'package:utaa_ecampus/src/screens/home/widgets/homewidgets.dart';

class HomeScreen extends StatelessWidget {
  final MainController mainController = Get.put(MainController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 20.0,
                  ),
                  child: Image(
                    image: AssetImage('assets/images/logo/logo.png'),
                    height: 80,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeScreenButtons(
                          icon: Icons.map,
                          text: 'Campus \n Map',
                          onPressed: () {
                            Get.toNamed('/campusmap');
                          },
                        ),
                        HomeScreenButtons(
                          icon: Icons.calendar_month,
                          text: 'My \n Calendar',
                          onPressed: () {
                            mainController.pageIndex(3);
                          },
                        ),
                        HomeScreenButtons(
                          icon: Icons.directions_bus,
                          text: 'Ring \n Hours',
                          onPressed: () {
                            mainController.pageIndex(1);
                          },
                        ),
                        HomeScreenButtons(
                          icon: Icons.restaurant,
                          text: 'Meal \n List',
                          onPressed: () {
                            Get.toNamed('/meallist');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeScreenButtons(
                          icon: Icons.people,
                          text: 'Attandence',
                          onPressed: () {
                            Get.toNamed('/attandence');
                          },
                        ),
                        HomeScreenButtons(
                          icon: Icons.badge,
                          text: 'Student ID',
                          onPressed: () {
                            mainController.pageIndex(0);
                          },
                        ),
                        HomeScreenButtons(
                          icon: Icons.question_answer,
                          text: 'Contact',
                          onPressed: () {
                            Get.toNamed('/contact');
                          },
                        ),
                        HomeScreenButtons(
                          icon: Icons.account_circle,
                          text: 'My Profile',
                          onPressed: () {
                            mainController.pageIndex(4);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              if (mainController.isGuest.value)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 10,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.report_problem,
                          color: Colors.red,
                          size: 25,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'You are not logged in!',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Please login to use all functionality.',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.report_problem,
                          color: Colors.red,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              if (!mainController.isGuest.value)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    bottom: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Today',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                            color: Color.fromARGB(255, 101, 101, 101),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          mainController.index.value = 3;
                        },
                        child: Text(
                          'Show All',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: Color.fromARGB(255, 101, 101, 101),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (!mainController.isGuest.value)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: SizedBox(
                    height: 115,
                    child: SfCalendar(
                      view: CalendarView.schedule,
                      firstDayOfWeek: 1,
                      headerHeight: 0,
                      initialDisplayDate: DateTime.now(),
                      minDate: DateTime.now(),
                      maxDate: DateTime.now().month.toString().length < 2
                          ? DateTime.now().day.toString().length < 2
                              ? DateTime.parse(
                                  "${DateTime.now().year}-0${DateTime.now().month}-0${DateTime.now().day} 23:59:00Z")
                              : DateTime.parse(
                                  "${DateTime.now().year}-0${DateTime.now().month}-${DateTime.now().day} 23:59:00Z")
                          : DateTime.now().day.toString().length < 2
                              ? DateTime.parse(
                                  "${DateTime.now().year}-${DateTime.now().month}-0${DateTime.now().day} 23:59:00Z")
                              : DateTime.parse(
                                  "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} 23:59:00Z"),
                      scheduleViewSettings: ScheduleViewSettings(
                        hideEmptyScheduleWeek: false,
                        monthHeaderSettings: MonthHeaderSettings(height: 0),
                        weekHeaderSettings: WeekHeaderSettings(height: 0),
                        dayHeaderSettings: DayHeaderSettings(width: 0),
                      ),
                      dataSource: _getDataSource(),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 30,
                  right: 30,
                  bottom: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Announcements',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                          color: Color.fromARGB(255, 101, 101, 101),
                        ),
                      ),
                    ),
                    Text(
                      'Show All',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: Color.fromARGB(255, 101, 101, 101),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    AnnouncementCard(),
                    SizedBox(
                      width: 20,
                    ),
                    AnnouncementCard(),
                    SizedBox(
                      width: 20,
                    ),
                    AnnouncementCard(),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 30,
                  right: 30,
                  bottom: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'News',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                          color: Color.fromARGB(255, 101, 101, 101),
                        ),
                      ),
                    ),
                    Text(
                      'Show All',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: Color.fromARGB(255, 101, 101, 101),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    AnnouncementCard(),
                    SizedBox(
                      width: 20,
                    ),
                    AnnouncementCard(),
                    SizedBox(
                      width: 20,
                    ),
                    AnnouncementCard(),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 30,
                  right: 30,
                  bottom: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Events',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                          color: Color.fromARGB(255, 101, 101, 101),
                        ),
                      ),
                    ),
                    Text(
                      'Show All',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: Color.fromARGB(255, 101, 101, 101),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    AnnouncementCard(),
                    SizedBox(
                      width: 20,
                    ),
                    AnnouncementCard(),
                    SizedBox(
                      width: 20,
                    ),
                    AnnouncementCard(),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _DataSource _getDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(hours: 4)),
      endTime: DateTime.now().add(Duration(hours: 5)),
      subject: 'Meeting',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      subject: 'Development Meeting   New York, U.S.A',
      color: Color(0xFFf527318),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      subject: 'Project Plan Meeting   Kuala Lumpur, Malaysia',
      color: Color(0xFFfb21f66),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: 2, hours: 2)),
      endTime: DateTime.now().add(Duration(days: 2, hours: 3)),
      subject: 'Support - Web Meeting   Dubai, UAE',
      color: Color(0xFFf3282b8),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: 1, hours: 1)),
      endTime: DateTime.now().add(Duration(days: 1, hours: 2)),
      subject: 'Project Release Meeting   Istanbul, Turkey',
      color: Color(0xFFf2a7886),
    ));
    appointments.add(Appointment(
        startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
        endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
        subject: 'Release Meeting',
        color: Colors.lightBlueAccent,
        isAllDay: true));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 2, days: -4)),
      endTime: DateTime.now().add(const Duration(hours: 4, days: -4)),
      subject: 'Performance check',
      color: Colors.amber,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 11, days: -2)),
      endTime: DateTime.now().add(const Duration(hours: 12, days: -2)),
      subject: 'Customer Meeting   Tokyo, Japan',
      color: Color(0xFFffb8d62),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
      endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
      subject: 'Retrospective',
      color: Colors.purple,
    ));

    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
