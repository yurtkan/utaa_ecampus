// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:utaa_ecampus/src/controllers/calendar_controller.dart';
import 'package:utaa_ecampus/src/controllers/info_controller.dart';
import 'package:utaa_ecampus/src/controllers/main_controller.dart';
import 'package:utaa_ecampus/src/screens/home/widgets/homewidgets.dart';
import 'package:utaa_ecampus/src/screens/informationscreens/info_screen.dart';

class HomeScreen extends StatelessWidget {
  final MainController mainController = Get.put(MainController());
  final InfoController infoController = Get.put(InfoController());
  final MyCalendarController calendarController =
      Get.put(MyCalendarController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    infoController.getNewsList(20);
    infoController.getAnnouncementsList(20);
    infoController.getEventsList(20);

    return Obx(
      () => Scaffold(
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
                    left: 30,
                    right: 30,
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
                            icon: Icons.badge,
                            text: 'Student ID',
                            onPressed: () {
                              mainController.pageIndex(0);
                            },
                          ),
                          HomeScreenButtons(
                            icon: Icons.calendar_month,
                            text: 'Calendar',
                            onPressed: () {
                              mainController.pageIndex(3);
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
                    top: 10,
                    left: 30,
                    right: 30,
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
                      TextButton(
                        onPressed: () {
                          Get.to(
                            InfoScreen(type: 'news'),
                            transition: Transition.rightToLeft,
                          );
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
                if (infoController.newsList.isNotEmpty)
                  SizedBox(
                    height: 170,
                    child: GetBuilder(
                      builder: (InfoController infoController) {
                        return InfoListView(infos: infoController.newsList);
                      },
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 30,
                    right: 30,
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
                      TextButton(
                        onPressed: () {
                          Get.to(
                            InfoScreen(type: 'announcement'),
                            transition: Transition.rightToLeft,
                          );
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
                if (infoController.announcementsList.isNotEmpty)
                  SizedBox(
                    height: 170,
                    child: GetBuilder(
                      builder: (InfoController infoController) {
                        return InfoListView(
                          infos: infoController.announcementsList,
                        );
                      },
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 30,
                    right: 30,
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
                      TextButton(
                        onPressed: () {
                          Get.to(
                            InfoScreen(type: 'event'),
                            transition: Transition.rightToLeft,
                          );
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
                if (infoController.eventsList.isNotEmpty)
                  SizedBox(
                    height: 170,
                    child: GetBuilder(
                      builder: (InfoController infoController) {
                        return InfoListView(
                          infos: infoController.eventsList,
                        );
                      },
                    ),
                  ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _DataSource _getDataSource() {
    calendarController.getCalList();
    return _DataSource(calendarController.appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
