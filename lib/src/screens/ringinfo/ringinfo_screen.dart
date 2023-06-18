// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utaa_ecampus/src/controllers/ring_controller.dart';
import 'package:utaa_ecampus/src/screens/ringinfo/ringlist_view.dart';

class RingInfoScreen extends StatelessWidget {
  RingInfoScreen({super.key});
  final RingController ringController = Get.put(RingController());

  @override
  Widget build(BuildContext context) {
    ringController.getRingList();
    return Scaffold(
      appBar: appBar(),
      body: Obx(
        () => ringController.ringList.isNotEmpty
            ? ringListView(context)
            : ringListEmpty(),
      ),
    );
  }

  Center ringListEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.sync_problem,
            size: 100,
            color: Colors.red,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('We couldn\'t take the ring list'),
          const Text('Please try again later.'),
        ],
      ),
    );
  }

  SingleChildScrollView ringListView(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.height - (Get.height * 0.15),
        child: GetBuilder(
          builder: (RingController ringController) {
            return RingListView(rings: ringController.ringList);
          },
        ),
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
          'Ring Information',
          style: TextStyle(
            color: Colors.black,
          ),
        ));
  }
}
