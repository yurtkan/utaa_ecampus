import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:utaa_ecampus/src/models/announcements.dart';

class AnnouncementsController extends GetxController {
  String? fetchAnnouncements = '';
  RxList<Announcements> announcementsList = <Announcements>[].obs;
  void getAnnouncements() {
    //menuAPI();
    if (fetchAnnouncements == null || fetchAnnouncements == '') {
      _getAnnouncements();
      //print("Menu fetched from local storage");
    }
    if (fetchAnnouncements != null) {
      var menu = jsonDecode(fetchAnnouncements!);
      for (var item in menu) {
        bool announcementsExists = announcementsList.any(
          (announcements) => announcements.title == item['title'],
        );
        if (!announcementsExists) {
          announcementsList.add(
            Announcements(
              item['title'],
              item['content'],
              item['date'],
              item['photo'],
              item['category'],
            ),
          );
        }
      }
    }
    //return mealList;
  }

  _getAnnouncements() {
    if (GetStorage().read('announcements') != null) {
      fetchAnnouncements = GetStorage().read('announcements');
    }
  }

  void menuAPI() async {
    const String APIurl =
        'https://athena.squarefox.org/ecampus/api/announcements.php';
    final bodyRequest = {};

    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      var data = response.body; //response.body);
      if (response.statusCode == 200) {
        fetchAnnouncements = data;
        GetStorage().write('announcements', data);
      } else {
        Get.snackbar('Connection Error',
            'Please check your connection and relaunch the app',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } catch (e) {
      // print(e);
      Get.snackbar('Exception occured', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}
