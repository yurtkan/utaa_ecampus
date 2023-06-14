import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  RxInt index = 2.obs;

  // MainController({super.key});
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  void pageIndex(int index) {
    this.index.value = index;
    update();
  }
}
