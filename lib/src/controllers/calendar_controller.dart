import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class MyCalendarController extends GetxController {
  String fetchCal = '';
  RxList<Appointment> appointments = <Appointment>[].obs;
  String? token = GetStorage().read('token');
  void getCalList() {
    appointments.clear();
    fetchCal = '';
    if (token != null && token != '' && token != 'Guest') {
      calAPI();
    }
    if (fetchCal == '' && token != null && token != '' && token != 'Guest') {
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
          MaterialColor color;
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
    // ignore: constant_identifier_names
    const String APIurl =
        'https://athena.squarefox.org/ecampus/api/index.php/calendar/list';
    final bodyRequest = {
      'hash': token,
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
        Get.snackbar('Connection Error Calendar',
            'Please check your connection and relaunch the app',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } catch (e) {
      //print(e);
      Get.snackbar('Exception occured Calendar', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}
