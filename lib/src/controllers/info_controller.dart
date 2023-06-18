import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:utaa_ecampus/src/models/info.dart';

class InfoController extends GetxController {
  String? fetchInfoAnnouncements = '';
  RxList<Info> announcementsList = <Info>[].obs;
  void getAnnouncementsList(int infoLimit) {
    announcementsList.clear();
    infoAPI(infoLimit, 'announcement');

    if (fetchInfoAnnouncements == null || fetchInfoAnnouncements == '') {
      _getInfo('announcement');
    }

    if (fetchInfoAnnouncements != null && fetchInfoAnnouncements != '') {
      var menu = jsonDecode(fetchInfoAnnouncements!);
      for (var item in menu) {
        // Check if the Ring item already exists in the list
        // bool ringExists = infoList.any(
        //   (info) => info.title == item['notice_title'],
        // );
        if (!(announcementsList
            .any((info) => info.title == item['notice_title']))) {
          announcementsList.add(
            Info(
              item['notice_id'],
              item['notice_case'],
              item['notice_title'],
              item['notice_txt'],
              item['notice_link'],
              item['notice_photo'] ?? 'null',
              item['notice_on_date'],
            ),
          );
        }
      }
    }
    //return ringList;
  }

  _getInfo(String type) {
    if (type == 'announcement') {
      if (GetStorage().read('announcement') != null ||
          GetStorage().read('announcement') != '') {
        fetchInfoAnnouncements = GetStorage().read('announcement');
      }
    } else if (type == 'news') {
      if (GetStorage().read('news') != null ||
          GetStorage().read('news') != '') {
        fetchInfoNews = GetStorage().read('news');
      }
    } else if (type == 'event') {
      if (GetStorage().read('event') != null ||
          GetStorage().read('event') != '') {
        fetchInfoEvents = GetStorage().read('event');
      }
    }
  }

  String? fetchInfoNews = '';
  RxList<Info> newsList = <Info>[].obs;
  void getNewsList(int infoLimit) {
    newsList.clear();
    infoAPI(infoLimit, 'news');
    if (fetchInfoNews == null || fetchInfoNews == '') {
      _getInfo('news');
    }
    if (fetchInfoNews != null && fetchInfoNews != '') {
      var menu = jsonDecode(fetchInfoNews!);
      for (var item in menu) {
        // Check if the Ring item already exists in the list
        // bool ringExists = infoList.any(
        //   (info) => info.title == item['notice_title'],
        // );
        if (!(newsList.any((info) => info.title == item['notice_title']))) {
          newsList.add(
            Info(
              item['notice_id'],
              item['notice_case'],
              item['notice_title'],
              item['notice_txt'],
              item['notice_link'],
              item['notice_photo'] ?? 'null',
              item['notice_on_date'],
            ),
          );
        }
      }
    }
    //return ringList;
  }

  String? fetchInfoEvents = '';
  RxList<Info> eventsList = <Info>[].obs;
  void getEventsList(int infoLimit) {
    eventsList.clear();
    infoAPI(infoLimit, 'event');
    if (fetchInfoEvents == null || fetchInfoEvents == '') {
      _getInfo('event');
    }
    if (fetchInfoEvents != null && fetchInfoEvents != '') {
      var menu = jsonDecode(fetchInfoEvents!);
      for (var item in menu) {
        // Check if the Ring item already exists in the list
        // bool ringExists = infoList.any(
        //   (info) => info.title == item['notice_title'],
        // );
        if (!(eventsList.any((info) => info.title == item['notice_title']))) {
          eventsList.add(
            Info(
              item['notice_id'],
              item['notice_case'],
              item['notice_title'],
              item['notice_txt'],
              item['notice_link'],
              item['notice_photo'] ?? 'null',
              item['notice_on_date'],
            ),
          );
        }
      }
    }
    //return ringList;
  }

  void infoAPI(int infoLimit, String infoCase) async {
    // ignore: constant_identifier_names
    const String APIurl =
        'https://athena.squarefox.org/ecampus/api/index.php/notice/list';
    final bodyRequest = {
      "case": infoCase.toString(),
      "limit": infoLimit.toString(),
    };
    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      var data = response.body; //response.body);
      if (response.statusCode == 200) {
        if (infoCase == 'announcement') {
          fetchInfoAnnouncements = data.toString();
          GetStorage().write('announcement', data);
        } else if (infoCase == 'news') {
          fetchInfoNews = data.toString();
          GetStorage().write('news', data);
        } else if (infoCase == 'event') {
          fetchInfoEvents = data.toString();
          GetStorage().write('event', data);
        } else {
          Get.snackbar('Connection Error Info',
              'Please check your connection and relaunch the app',
              colorText: Colors.white, backgroundColor: Colors.red);
        }
        //GetStorage().write('ring', data);
        //print("Menu fetched from API");
      } else {
        //print(response.statusCode);
        Get.snackbar('Connection Error Info',
            'Please check your connection and relaunch the app',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } catch (e) {
      //print(e);
      Get.snackbar('Exception occured Info', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}
