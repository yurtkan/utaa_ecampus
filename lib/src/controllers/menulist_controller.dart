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
    //menuAPI();
    if (fetchMenu == null || fetchMenu == '') {
      //_getMenu();
      _setMenu();
      //print("Menu fetched from local storage");
    }
    if (fetchMenu != null) {
      var menu = jsonDecode(fetchMenu!);
      for (var item in menu) {
        // Check if the Meal item already exists in the list
        bool mealExists = mealList.any((meal) => meal.date == item['date']);
        if (!mealExists) {
          mealList.add(
            Meal(
              item['date'],
              item['day'],
              item['meal1'],
              item['meal1calorie'],
              item['meal2'],
              item['meal2calorie'],
              item['meal3'],
              item['meal3calorie'],
              item['meal4'],
              item['meal4calorie'],
              item['totalcalorie'],
            ),
          );
        }
      }
    }
    //return mealList;
  }

  _setMenu() {
    fetchMenu =
        "[{\"day\":\"PERŞEMBE\",\"date\":\"01.06.2023\",\"meal1\":\"YAYLA ÇORBASI\",\"meal1calorie\":\"148\",\"meal2\":\"ANKARA TAVA\",\"meal2calorie\":\"341\",\"meal3\":\"ŞAKŞUKA\",\"meal3calorie\":\"217\",\"meal4\":\"MEYVE\",\"meal4calorie\":\"80\",\"totalcalorie\":\"1000\"},{\"day\":\"Cuma\",\"date\":\"02.06.2023\",\"meal1\":\"YAYLA ÇORBASI\",\"meal1calorie\":\"148\",\"meal2\":\"ANKARA TAVA\",\"meal2calorie\":\"341\",\"meal3\":\"ŞAKŞUKA\",\"meal3calorie\":\"217\",\"meal4\":\"MEYVE\",\"meal4calorie\":\"80\",\"totalcalorie\":\"1000\"},{\"day\":\"Pazartesi\",\"date\":\"03.06.2023\",\"meal1\":\"YAYLA ÇORBASI\",\"meal1calorie\":\"148\",\"meal2\":\"ANKARA TAVA\",\"meal2calorie\":\"341\",\"meal3\":\"ŞAKŞUKA\",\"meal3calorie\":\"217\",\"meal4\":\"MEYVE\",\"meal4calorie\":\"80\",\"totalcalorie\":\"1000\"},{\"day\":\"Salı\",\"date\":\"04.06.2023\",\"meal1\":\"YAYLA ÇORBASI\",\"meal1calorie\":\"148\",\"meal2\":\"ANKARA TAVA\",\"meal2calorie\":\"341\",\"meal3\":\"ŞAKŞUKA\",\"meal3calorie\":\"217\",\"meal4\":\"MEYVE\",\"meal4calorie\":\"80\",\"totalcalorie\":\"1000\"},{\"day\":\"Çarşamba\",\"date\":\"05.06.2023\",\"meal1\":\"YAYLA ÇORBASI\",\"meal1calorie\":\"148\",\"meal2\":\"ANKARA TAVA\",\"meal2calorie\":\"341\",\"meal3\":\"ŞAKŞUKA\",\"meal3calorie\":\"217\",\"meal4\":\"MEYVE\",\"meal4calorie\":\"80\",\"totalcalorie\":\"1000\"}]";
  }

  _getMenu() {
    if (GetStorage().read('menu') != null) {
      fetchMenu = GetStorage().read('menu');
    }
  }

  void menuAPI() async {
    const String APIurl = 'https://athena.squarefox.org/ecampus/api/menu.php';
    final bodyRequest = {};

    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      var data = response.body; //response.body);
      if (response.statusCode == 200) {
        fetchMenu = data;
        GetStorage().write('menu', data);
      } else {
        Get.snackbar('Connection Error',
            'Please check your connection and relaunch the app',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } catch (e) {
      // print(e);
      Get.snackbar('Exception occured', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}
