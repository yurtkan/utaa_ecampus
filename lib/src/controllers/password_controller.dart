import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class PasswordController extends GetxController {
  final oldpasswordfield = TextEditingController();
  final newpasswordfield = TextEditingController();
  final hash = GetStorage().read('token');

  void changepassAPI() async {
    // ignore: constant_identifier_names
    const String APIurl =
        'https://athena.squarefox.org/ecampus/api/index.php/user/changepassword';
    final bodyRequest = {
      "hash": hash,
      "oldpass": md5
          .convert(
            utf8.encode(
              oldpasswordfield.text.toString(),
            ),
          )
          .toString(),
      "newpass": md5
          .convert(
            utf8.encode(
              oldpasswordfield.text.toString(),
            ),
          )
          .toString(),
    };

    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      //var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        newpasswordfield.clear();
        oldpasswordfield.clear();
        Get.back();
      } else {
        Get.snackbar('Error', 'maybe a Server trouble',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } catch (e) {
      // print(e);
      Get.snackbar('Exception occured', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    // finally {
    //   print('Request succefuly terminated');
    // }
  }
}
