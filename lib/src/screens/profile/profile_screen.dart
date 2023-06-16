import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:utaa_ecampus/src/controllers/main_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final screenHeight = Get.height;

  final MainController mainController = Get.put(MainController());

  void logoutUser() async {
    Get.offAllNamed('/welcome');
    GetStorage().erase();
    mainController.index.value = 2;
    await DefaultCacheManager().emptyCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainController.isGuest.value ? guestProfile() : userProfile(),
    );
  }

  Column guestProfile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(32),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.blue,
                width: 3,
              ),
            ),
            child: Container(
              width: 150.0,
              height: 150.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.hardEdge,
              child: const Icon(
                Icons.person,
                size: 100,
              ),
            ),
          ),
        ), // Add some space between the profile picture and text
        const Text(
          'Guest',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        const Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        ListTile(
          leading: const Icon(Icons.login_rounded),
          title: const Text(
            'Log In',
            style: TextStyle(fontSize: 22),
          ),
          trailing: const Icon(Icons.chevron_right_rounded),
          onTap: logoutUser,
        ),
        // const Divider(
        //   thickness: 1,
        //   height: 0,
        // ),
        const Spacer(),
      ],
    );
  }

  Column userProfile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: Get.height * 0.01,
        ),
        Padding(
          padding: const EdgeInsets.all(32),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.blue,
                width: 3,
              ),
            ),
            child: Container(
              width: 150.0,
              height: 150.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.hardEdge,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: mainController.photo.value,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.person),
              ),
            ),
          ),
        ),
        Text(
          mainController.name.value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          thickness: 3,
          indent: Get.width * 0.2,
          endIndent: Get.width * 0.2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Student No : ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    mainController.studentNumber.value.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Faculty : ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    mainController.facultyEng.value,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Department : ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    mainController.departmentEng.value.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Student Mail : ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    mainController.email.value,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        const Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        ListTile(
          leading: const Icon(Icons.lock_outline_rounded),
          title: const Text(
            'Password',
            style: TextStyle(fontSize: 22),
          ),
          trailing: const Icon(Icons.chevron_right_rounded),
          onTap: () {},
        ),
        const Divider(
          thickness: 1,
          height: 0,
        ),
        ListTile(
          leading: const Icon(Icons.calendar_month_outlined),
          title: const Text(
            'Schedule',
            style: TextStyle(fontSize: 22),
          ),
          trailing: const Icon(Icons.chevron_right_rounded),
          onTap: () {},
        ),
        const Divider(
          thickness: 1,
          height: 0,
        ),
        ListTile(
          leading: const Icon(Icons.logout_rounded),
          title: const Text(
            'Logout',
            style: TextStyle(fontSize: 22),
          ),
          trailing: const Icon(Icons.chevron_right_rounded),
          onTap: logoutUser,
        ),
        const Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        SizedBox(
          height: Get.height * 0.1,
        ),
      ],
    );
  }
}
