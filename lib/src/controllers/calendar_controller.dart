import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class MyCalendarController extends GetxController {
  String fetchCal = '';
  RxList<Appointment> appointments = <Appointment>[].obs;
  void getCalList() {
    appointments.clear();
    fetchCal = '';
    calAPI();
    if (fetchCal == '') {
      _getCal();
    }
    if (fetchCal != '') {
      var menu = jsonDecode(fetchCal);
      for (var item in menu) {
        // Check if the Ring item already exists in the list
        bool appointmentExist = appointments.any(
          (appointment) =>
              appointment.subject ==
              ('${item['calendar_course']}  /  ${item['calendar_loc']}'),
        );
        if (!appointmentExist) {
          var color;
          if (item['calendar_case'].toString() == 'lab') {
            color = Colors.red;
          } else if (item['calendar_case'].toString() == 'exam') {
            color = Colors.green;
          } else if (item['calendar_case'].toString() == 'meeting') {
            color = Colors.purple;
          } else if (item['calendar_case'].toString() == 'lecture') {
            color = Colors.orange;
          } else {
            color = Colors.blue;
          }
          appointments.add(
            Appointment(
                startTime: DateTime.parse(
                    '${item['calendar_date'].toString()} ${item['calendar_strt_time'].toString()}Z'),
                endTime: DateTime.parse(
                    '${item['calendar_date']} ${item['calendar_end_time']}Z'),
                subject:
                    ('${item['calendar_course']}  /  ${item['calendar_loc']}'),
                color: color),
          );
        }
      }
    }
    //return ringList;
  }

  _getCal() {
    if (GetStorage().read('calendar') != null) {
      fetchCal = GetStorage().read('calendar');
    } else {
      fetchCal = '';
    }
  }

  void calAPI() async {
    const String APIurl =
        'https://athena.squarefox.org/ecampus/api/index.php/calendar/list';
    final bodyRequest = {
      'hash': GetStorage().read('token'),
    };
    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      var data = response.body;
      //print(data);
      if (response.statusCode == 200) {
        fetchCal = data;
        GetStorage().write('calendar', data);
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
