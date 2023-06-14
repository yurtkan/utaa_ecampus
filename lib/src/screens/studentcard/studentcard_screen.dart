import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StudentCardScreen extends StatelessWidget {
  StudentCardScreen({super.key});

  final RxBool _isValid = false.obs;
  final RxBool _isGuest = true.obs;
  final RxInt _studentNumber = 111111111.obs;
  final RxInt _tcNumber = 11111111111.obs;
  final RxString _name = 'Name Update Error'.obs;
  final RxString _faculty = 'Faculty Update Error'.obs;
  final RxString _facultyEng = 'Faculty Update Error'.obs;
  final RxString _department = 'Department Update Error'.obs;
  final RxString _departmentEng = 'Department Update Error'.obs;
  final RxString _photo = ''.obs;

  void checkUser() {
    String? token = GetStorage().read('token');
    if (token == null || token == 'Guest') {
      _isGuest.value = true;
      _isValid.value = false;
    } else {
      _isGuest.value = false;
      _isValid.value = true;
      _studentNumber.value = GetStorage().read('studentNumber')!;
      _tcNumber.value = GetStorage().read('tcNumber')!;
      _name.value = GetStorage().read('name')!;
      _faculty.value = GetStorage().read('faculty')!;
      _facultyEng.value = GetStorage().read('facultyeng')!;
      _department.value = GetStorage().read('department')!;
      _departmentEng.value = GetStorage().read('departmenteng')!;
      _photo.value = GetStorage().read('photo')!;
    }
  }

  @override
  Widget build(BuildContext context) {
    checkUser();

    return Scaffold(
      appBar: appbar(),
      body: Obx(() => _isGuest.value == true ? guestCard() : studentCard()),
    );
  }

  SizedBox guestCard() {
    return const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.cancel,
            color: Colors.red,
            size: 100,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'You are not logged in!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Please login to see your student card.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Padding studentCard() {
    return Padding(
      padding: const EdgeInsets.only(
          top: 50.0, left: 20.0, right: 20.0, bottom: 90.0),
      child: RotatedBox(
        quarterTurns: 1,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 0, 97, 161),
                  Color.fromARGB(255, 0, 97, 161),
                  Color.fromARGB(255, 0, 109, 176),
                  Color.fromARGB(255, 0, 145, 228),
                  Color.fromARGB(255, 0, 145, 228),
                  Color.fromARGB(255, 0, 145, 228),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          child: Column(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20.0,
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      child: Image.asset(
                        'assets/images/logo/logow.png',
                        width: 80,
                        height: 80,
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Türk Hava Kurumu Üniversitesi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                          ),
                        ),
                        Text(
                          "University of Turkish Aeronautical Association",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Havacılık ve Uzay Bilimleri/Aeronautics and Astronautics",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      child: Image.asset(
                        'assets/images/logo/logow.png',
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 25.0,
                    right: 25.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 200,
                        width: 150,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Obx(
                          () => _photo.value == ''
                              ? const Icon(
                                  Icons.account_box_outlined,
                                  size: 100,
                                  color: Colors.grey,
                                )
                              : Image.network(
                                  _photo.value,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(" T.C. KİMLİK NO\n(T.R. ID Number)"),
                          Text(" ÖĞRENCİ NO\n(Student Number)"),
                          Text(" ADI SOYADI \n(Name Surname)"),
                          Text(" FAKÜLTE\n(Faculty)"),
                          Text(" BÖLÜM\n(Department)"),
                        ],
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(" :\n"),
                          Text(" :\n"),
                          Text(" :\n"),
                          Text(" :\n"),
                          Text(" :\n"),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Obx(
                        () => Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("$_tcNumber\n"),
                            Text("$_studentNumber\n"),
                            Text("$_name\n"),
                            Text("$_faculty\n($_facultyEng)"),
                            Text("$_department\n($_departmentEng)"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Student Card"),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.all(Radius.circular(20.0))),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Obx(
                () => _isValid.value == true
                    ? Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.verified,
                                color: Colors.green[600],
                              ),
                            ),
                            const TextSpan(text: '  Valid / Geçerli '),
                          ],
                        ),
                      )
                    : Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.cancel,
                                color: Colors.red[600],
                              ),
                            ),
                            const TextSpan(text: '  Invalid / Geçersiz '),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
      automaticallyImplyLeading: false,
    );
  }
}
