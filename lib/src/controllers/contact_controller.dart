import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:utaa_ecampus/src/controllers/main_controller.dart';

class ContactController extends GetxController {
  final MainController mainController = Get.put(MainController());
  final String? hash = GetStorage().read('token');
  final titlefield = TextEditingController();
  final textfield = TextEditingController();

  void contactAPI() async {
    // ignore: constant_identifier_names
    const String APIurl =
        'https://athena.squarefox.org/ecampus/api/index.php/contact/confirm';
    final bodyRequest = {
      "hash": hash,
      "title": titlefield.text.toString(),
      "text": textfield.text.toString(),
    };

    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      //var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        textfield.clear();
        titlefield.clear();
        Get.back();
        Get.snackbar('Contact Form', 'Your Form has been sent',
            colorText: Colors.black, backgroundColor: Colors.green);
      } else if (response.statusCode == 401) {
        Get.snackbar(
          'Contact Form Error',
          'maybe a Server trouble',
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      } else {
        Get.snackbar('Error', 'maybe a Server trouble',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } catch (e) {
      // print(e);
      Get.snackbar('Exception occured', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}
