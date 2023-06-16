import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  RxInt index = 2.obs;
  RxBool isGuest = false.obs;
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
      if (GetStorage().read('isValid') != null) {
        if (GetStorage().read('isValid') == 'true') {
          isValid.value = true;
        } else {
          isValid.value = false;
        }
      }
      if (GetStorage().read('studentNumber') != null) {
        studentNumber.value = int.parse(GetStorage().read('studentNumber')!);
      }
      if (GetStorage().read('mail') != null) {
        email.value = GetStorage().read('mail')!;
      }
      if (GetStorage().read('tcNumber') != null) {
        tcNumber.value = int.parse(GetStorage().read('tcNumber')!);
      }
      if (GetStorage().read('name') != null) {
        name.value = GetStorage().read('name')!;
      }
      if (GetStorage().read('faculty') != null) {
        faculty.value = GetStorage().read('faculty')!;
      }
      if (GetStorage().read('facultyeng') != null) {
        facultyEng.value = GetStorage().read('facultyeng')!;
      }
      if (GetStorage().read('department') != null) {
        department.value = GetStorage().read('department')!;
      }
      if (GetStorage().read('departmenteng') != null) {
        departmentEng.value = GetStorage().read('departmenteng')!;
      }
      if (GetStorage().read('photo') != null) {
        photo.value = GetStorage().read('photo')!;
      }
    }
  }
}
