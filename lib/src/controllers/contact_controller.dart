// import 'dart:convert';
// import 'package:crypto/crypto.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:get_storage/get_storage.dart';
// import 'package:utaa_ecampus/src/controllers/main_controller.dart';

// class ContactController extends GetxController {
//   final MainController mainController = Get.put(MainController());

//   final titlefield = TextEditingController();
//   final textfield = TextEditingController();

//   void loginAPI() async {
//     const String APIurl =
//         'https://athena.squarefox.org/ecampus/api/index.php/user/login';
//     final bodyRequest = {
//       "mail": loginfield.text.toString(),
//       "pass": md5
//           .convert(
//             utf8.encode(
//               passwordfield.text.toString(),
//             ),
//           )
//           .toString(),
//     };

//     try {
//       final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
//       //var data = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         textfield.clear();
//         titlefield.clear();
//         Get.offNamed('/mainscreen');
//         Get.snackbar('Contact Form', 'Your Form has been sent',
//             colorText: Colors.black, backgroundColor: Colors.green);
//       } else if (response.statusCode == 401) {
//         Get.snackbar(
//           'Contact Form Error',
//           'maybe a Server trouble',
//           colorText: Colors.white,
//           backgroundColor: Colors.red,
//         );
//       } else {
//         Get.snackbar('Error', 'maybe a Server trouble',
//             colorText: Colors.white, backgroundColor: Colors.red);
//       }
//     } catch (e) {
//       // print(e);
//       Get.snackbar('Exception occured', e.toString(),
//           colorText: Colors.white, backgroundColor: Colors.red);
//     }
//     // finally {
//     //   print('Request succefuly terminated');
//     // }
//   }
// }
