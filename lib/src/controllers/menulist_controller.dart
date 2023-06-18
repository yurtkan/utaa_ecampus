import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:utaa_ecampus/src/models/meal.dart';

class MenuListController extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  //   menuAPI();
  // }

  String? fetchMenu = '';
  RxList<Meal> mealList = <Meal>[].obs;
  void getMealList() {
    mealList.clear();
    menuAPI();
    if (fetchMenu == null || fetchMenu == '') {
      _getMenu();
      //_setMenu();
    }
    if (fetchMenu != null) {
      var menu = jsonDecode(fetchMenu!);
      for (var item in menu) {
        // Check if the Meal item already exists in the list
        bool mealExists =
            mealList.any((meal) => meal.date == item['meal_date']);
        if (!mealExists) {
          mealList.add(
            Meal(
              item['meal_date'],
              item['meal_day'],
              item['meal_1'],
              item['meal_1_cal'],
              item['meal_2'],
              item['meal_2_cal'],
              item['meal_3'],
              item['meal_3_cal'],
              item['meal_4'],
              item['meal_4_cal'],
              item['meal_total_cal'],
            ),
          );
        }
      }
    }
    //return mealList;
  }

  _getMenu() {
    if (GetStorage().read('menu') != null || GetStorage().read('menu') != '') {
      fetchMenu = GetStorage().read('menu');
    } else {
      fetchMenu = '';
    }
  }

  void menuAPI() async {
    const String APIurl =
        'https://athena.squarefox.org/ecampus/api/index.php/meal/list';
    final bodyRequest = {};
    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      var data = response.body; //response.body);
      if (response.statusCode == 200) {
        fetchMenu = data;
        GetStorage().write('menu', data);
        //print("Menu fetched from API");
      } else {
        Get.snackbar('Connection Error',
            'Please check your connection and relaunch the app',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } catch (e) {
      //print(e);
      Get.snackbar('Exception occured', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}
