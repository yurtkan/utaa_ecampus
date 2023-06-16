import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utaa_ecampus/src/controllers/announcements_controller.dart';
import 'package:utaa_ecampus/src/screens/informationscreens/announcements_view.dart';

class AnnouncementsScreen extends StatelessWidget {
  AnnouncementsScreen({super.key});
  final AnnouncementsController announcementsController =
      Get.put(AnnouncementsController());

  @override
  Widget build(BuildContext context) {
    announcementsController.getAnnouncements();
    return Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                ((MediaQuery.of(context).size.height * 10) / 100),
            child: GetBuilder(
              builder: (AnnouncementsController announcementsController) {
                return AnnouncementsListView(
                    announcements: announcementsController.announcementsList);
              },
            ),
          ),
        ));
  }

  AppBar appBar() {
    return AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            //Get.offAllNamed('/mainscreen');
            Get.back();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Announcements',
          style: TextStyle(
            color: Colors.black,
          ),
        ));
  }
}
