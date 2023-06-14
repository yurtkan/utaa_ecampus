import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const Center(
        child: Text('Contact Page'),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          //Get.offAllNamed('/mainscreen');
          Get.back();
        },
      ),
      centerTitle: true,
      title: const Text(
        'Contact Form',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
