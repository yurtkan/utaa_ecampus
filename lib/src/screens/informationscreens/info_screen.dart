import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utaa_ecampus/src/controllers/info_controller.dart';
import 'package:utaa_ecampus/src/screens/informationscreens/infolistviewlong.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({
    super.key,
    required this.type,
  });
  final String type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
    );
  }

  _body() {
    if (type == "news") {
      return SizedBox(
        height: Get.height,
        child: GetBuilder(
          builder: (InfoController infoController) {
            return InfoListViewLong(infos: infoController.newsList);
          },
        ),
      );
    } else if (type == "announcement") {
      return SizedBox(
        height: Get.height,
        child: GetBuilder(
          builder: (InfoController infoController) {
            return InfoListViewLong(infos: infoController.announcementsList);
          },
        ),
      );
    } else if (type == "event") {
      return SizedBox(
        height: Get.height,
        child: GetBuilder(
          builder: (InfoController infoController) {
            return InfoListViewLong(infos: infoController.eventsList);
          },
        ),
      );
    } else {
      return SizedBox(
        height: Get.height,
        child: const Column(
          children: [
            Icon(
              Icons.info,
              size: 100,
              color: Colors.grey,
            ),
            Text(
              "No Info",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }
  }

  _appBar(BuildContext context) {
    return AppBar(
      title: pageTitle(),
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  pageTitle() {
    if (type == "news") {
      return const Text(
        "News",
        style: TextStyle(
          color: Colors.black,
        ),
      );
    } else if (type == "announcement") {
      return const Text(
        "Announcement",
        style: TextStyle(
          color: Colors.black,
        ),
      );
    } else if (type == "event") {
      return const Text(
        "Event",
        style: TextStyle(
          color: Colors.black,
        ),
      );
    } else {
      return const Text(
        "Info",
        style: TextStyle(
          color: Colors.black,
        ),
      );
    }
  }
}
