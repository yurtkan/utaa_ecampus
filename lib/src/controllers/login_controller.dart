import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:utaa_ecampus/src/controllers/main_controller.dart';

class LoginController extends GetxController {
  final MainController mainController = Get.put(MainController());

  final loginfield = TextEditingController();
  final passwordfield = TextEditingController();

  void loginAPI() async {
    // ignore: constant_identifier_names
    const String APIurl =
        'https://athena.squarefox.org/ecampus/api/index.php/user/login';
    final bodyRequest = {
      "mail": loginfield.text.toString(),
      "pass": md5
          .convert(
            utf8.encode(
              passwordfield.text.toString(),
            ),
          )
          .toString(),
    };
    //print(bodyRequest);
    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        GetStorage().write('name', data['uname'].toString());
        GetStorage().write('mail', data['mail'].toString());
        GetStorage().write('token', data['hash'].toString());
        GetStorage().write('studentNumber', data['stuNo'].toString());
        GetStorage().write('tcNumber', data['idNo'].toString());
        GetStorage().write('faculty', data['facTr'].toString());
        GetStorage().write('facultyeng', data['facEn'].toString());
        GetStorage().write('department', data['depTr'].toString());
        GetStorage().write('departmenteng', data['depEn'].toString());
        GetStorage().write('photo', data['photo'].toString());
        GetStorage().write('isValid', data['active'].toString());
        GetStorage().write('courses', data['courses'].toString());
        mainController.checkUser();
        loginfield.clear();
        passwordfield.clear();
        Get.offNamed('/mainscreen');
      } else if (response.statusCode == 401) {
        Get.snackbar(
          'Login Failed',
          'Please check your credentials',
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      } else {
        Get.snackbar('Login Failed', 'maybe a Server trouble',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } catch (e) {
      //print(e);
      Get.snackbar('Exception occured Login', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}
