import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:utaa_ecampus/src/controllers/menulist_controller.dart';
import 'package:utaa_ecampus/src/models/meal.dart';

final MenuListController controller = Get.put(MenuListController());

class MealListView extends StatelessWidget {
  const MealListView({
    Key? key,
    required this.meals,
  }) : super(key: key);

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 10, right: 10),
        scrollDirection: Axis.vertical,
        itemCount: meals.length,
        itemBuilder: (_, index) {
          Meal meal = meals[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 160,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        '${meal.date}\n${meal.day}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meal.meal1,
                        ),
                        Text(
                          meal.meal2,
                        ),
                        Text(
                          meal.meal3,
                        ),
                        Text(
                          meal.meal4,
                        ),
                        const Text(
                          "\nTotal Calorie:",
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meal.meal1Calorie,
                        ),
                        Text(
                          meal.meal2Calorie,
                        ),
                        Text(
                          meal.meal3Calorie,
                        ),
                        Text(
                          meal.meal4Calorie,
                        ),
                        Text(
                          "\n${meal.totalCalorie}",
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kcal",
                        ),
                        Text(
                          "Kcal",
                        ),
                        Text(
                          "Kcal",
                        ),
                        Text(
                          "Kcal",
                        ),
                        Text(
                          "\nKcal",
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) {
          return const Padding(padding: EdgeInsets.only(right: 50));
        },
      ),
    );
  }
}
