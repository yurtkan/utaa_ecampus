import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  RxInt index = 2.obs;
  RxBool isGuest = true.obs;
  RxBool isValid = false.obs;
  RxInt studentNumber = 111111111.obs;
  RxInt tcNumber = 11111111111.obs;
  RxString name = 'Name Update Error'.obs;
  RxString faculty = 'Faculty Update Error'.obs;
  RxString facultyEng = 'Faculty Update Error'.obs;
  RxString department = 'Department Update Error'.obs;
  RxString departmentEng = 'Department Update Error'.obs;
  RxString email = 'Mail Update Error'.obs;
  RxString photo = ''.obs;
  RxString token = ''.obs;

  void pageIndex(int index) {
    this.index.value = index;
    update();
  }

  void checkUser() {
    String? token = GetStorage().read('token');
    if (token == null || token == 'Guest') {
      isGuest.value = true;
      name.value = 'Guest';
    } else {
      isGuest.value = false;
      studentNumber.value = GetStorage().read('studentNumber')!;
      tcNumber.value = GetStorage().read('tcNumber')!;
      name.value = GetStorage().read('name')!;
      faculty.value = GetStorage().read('faculty')!;
      facultyEng.value = GetStorage().read('facultyeng')!;
      department.value = GetStorage().read('department')!;
      departmentEng.value = GetStorage().read('departmenteng')!;
      photo.value = GetStorage().read('photo')!;
    }
  }
}
