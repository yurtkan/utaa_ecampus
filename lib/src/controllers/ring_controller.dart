import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:utaa_ecampus/src/models/ring.dart';

class RingController extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  //   menuAPI();
  // }

  String? fetchRing = '';
  RxList<Ring> ringList = <Ring>[].obs;
  void getRingList() {
    ringList.clear();
    ringAPI();
    if (fetchRing == null || fetchRing == '') {
      _getRing();
    }
    if (fetchRing != null) {
      var menu = jsonDecode(fetchRing!);
      for (var item in menu) {
        // Check if the Ring item already exists in the list
        bool ringExists = ringList.any((ring) => ring.id == item['ring_id']);
        if (!ringExists) {
          ringList.add(
            Ring(
              item['ring_id'],
              item['ring_name'],
              item['ring_come_hour'],
              item['ring_leave_hour'],
              item['ring_stops'],
            ),
          );
        }
      }
    }
    //return ringList;
  }

  _getRing() {
    if (GetStorage().read('ring') != null || GetStorage().read('ring') != '') {
      fetchRing = GetStorage().read('ring');
    } else {
      fetchRing = '';
    }
  }

  void ringAPI() async {
    const String APIurl =
        'https://athena.squarefox.org/ecampus/api/index.php/ring/list';
    final bodyRequest = {};
    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      var data = response.body; //response.body);
      if (response.statusCode == 200) {
        fetchRing = data;
        GetStorage().write('ring', data);
        //print("Menu fetched from API");
      } else {
        Get.snackbar('Connection Error',
            'Please check your connection and relaunch the app',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } catch (e) {
      //print(e);
      Get.snackbar('Exception occured', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}
