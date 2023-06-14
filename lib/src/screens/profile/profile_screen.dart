import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:utaa_ecampus/src/controllers/main_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final MainController mainController = Get.put(MainController());

  final RxBool _isGuest = true.obs;
  final RxInt _studentNumber = 111111111.obs;
  final RxString _name = 'Name Update Error'.obs;
  final RxString _faculty = 'Faculty Update Error'.obs;
  final RxString _department = 'Department Update Error'.obs;
  final RxString _email = 'Mail Update Error'.obs;
  final RxString _photo = ''.obs;

  void checkUser() {
    String? token = GetStorage().read('token');
    if (token == null || token == 'Guest') {
      _isGuest.value = true;
      _name.value = 'Guest';
    } else {
      _isGuest.value = false;
      _studentNumber.value = GetStorage().read('studentNumber')!;
      _name.value = GetStorage().read('name')!;
      _faculty.value = GetStorage().read('facultyeng')!;
      _department.value = GetStorage().read('departmenteng')!;
      _photo.value = GetStorage().read('photo')!;
      _email.value = GetStorage().read('email')!;
    }
  }

  @override
  Widget build(BuildContext context) {
    checkUser();
    return Scaffold(
      body: _isGuest.value ? guestProfile() : userProfile(),
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
        Text(
          _name.value,
          style: const TextStyle(
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
          onTap: () {},
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
                imageUrl: _photo.value,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.person),
              ),
            ),
          ),
        ), // Add some space between the profile picture and text
        Text(
          _name.value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          _studentNumber.value.toString(),
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          _department.value,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          _email.value,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        const Spacer(),
        const Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        ListTile(
          leading: const Icon(Icons.account_circle_outlined),
          title: const Text(
            'Edit Profile',
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
          leading: const Icon(Icons.credit_card_rounded),
          title: const Text(
            'Student Card',
            style: TextStyle(fontSize: 22),
          ),
          trailing: const Icon(Icons.chevron_right_rounded),
          onTap: () {
            mainController.index.value = 0;
          },
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
          onTap: () {},
        ),
        // const Divider(
        //   thickness: 1,
        //   height: 0,
        // ),
        const Spacer(),
      ],
    );
  }
}
