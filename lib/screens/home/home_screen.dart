// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utaa_ecampus/screens/home/widgets/homewidgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
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
                            ),
                            HomeScreenButtons(
                              icon: Icons.calendar_month,
                              text: 'My \n Calendar',
                            ),
                            HomeScreenButtons(
                              icon: Icons.directions_bus,
                              text: 'Ring \n Hours',
                            ),
                            HomeScreenButtons(
                              icon: Icons.map,
                              text: 'Meal \n List',
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
                            ),
                            HomeScreenButtons(
                              icon: Icons.badge,
                              text: 'Student ID',
                            ),
                            HomeScreenButtons(
                              icon: Icons.question_answer,
                              text: 'Contact',
                            ),
                            HomeScreenButtons(
                              icon: Icons.account_circle,
                              text: 'My Profile',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: SizedBox(
                      height: 100,
                      child: Placeholder(),
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
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.white, // <-- Button color
                      foregroundColor: Colors.blue, // <-- Splash color
                    ),
                    child: const Icon(Icons.menu, color: Colors.black),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.white, // <-- Button color
                      foregroundColor: Colors.blue, // <-- Splash color
                    ),
                    child: const Icon(Icons.notifications, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
