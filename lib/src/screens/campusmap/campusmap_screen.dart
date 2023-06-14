import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampusMapScreen extends StatelessWidget {
  const CampusMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const Center(
        child: Text('Campus Map'),
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
        'Meal List',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
