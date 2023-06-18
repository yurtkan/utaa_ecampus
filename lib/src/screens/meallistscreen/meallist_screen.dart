import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utaa_ecampus/src/controllers/menulist_controller.dart';
import 'package:utaa_ecampus/src/screens/meallistscreen/meallist_view.dart';

class MealListScreen extends StatelessWidget {
  MealListScreen({super.key});
  final MenuListController menuListController = Get.put(MenuListController());

  @override
  Widget build(BuildContext context) {
    menuListController.getMealList();
    return Scaffold(
      appBar: appBar(),
      body: Obx(
        () => menuListController.mealList.isNotEmpty
            ? mealListView(context)
            : mealListEmpty(),
      ),
    );
  }

  Center mealListEmpty() {
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
          const Text('We couldn\'t take the meal list'),
          const Text('Please try again later.'),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              menuListController.getMealList();
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView mealListView(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height -
            ((MediaQuery.of(context).size.height * 10) / 100),
        child: GetBuilder(
          builder: (MenuListController menuListController) {
            return MealListView(meals: menuListController.mealList);
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
          'Meal List',
          style: TextStyle(
            color: Colors.black,
          ),
        ));
  }
}
