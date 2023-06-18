import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class PasswordController extends GetxController {
  final oldpasswordfield = TextEditingController();
  final newpasswordfield = TextEditingController();
  final newpasswordagainfield = TextEditingController();
  final hash = GetStorage().read('token');

  void changepassAPI() async {
    // ignore: constant_identifier_names
    const String APIurl =
        'https://athena.squarefox.org/ecampus/api/index.php/user/changepass';
    final bodyRequest = {
      "hash": hash.toString(),
      "old_pass": md5
          .convert(
            utf8.encode(
              oldpasswordfield.text.toString(),
            ),
          )
          .toString(),
      "new_pass": md5
          .convert(
            utf8.encode(
              newpasswordfield.text.toString(),
            ),
          )
          .toString(),
    };
    //print(bodyRequest);
    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      //var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        //print(data);
        newpasswordfield.clear();
        oldpasswordfield.clear();
        newpasswordagainfield.clear();
        Get.back();
        Get.snackbar('Success', 'Password Changed',
            colorText: Colors.black, backgroundColor: Colors.green);
      } else if (response.statusCode == 401) {
        //print(response.statusCode);
        Get.snackbar('Error', 'Please check your password',
            colorText: Colors.white, backgroundColor: Colors.red);
      } else {
        //print(response.statusCode);
        Get.snackbar('Error', 'Something went wrong',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } catch (e) {
      // print(e);
      Get.snackbar('Exception occured', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}
