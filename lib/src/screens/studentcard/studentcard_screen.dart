import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utaa_ecampus/src/controllers/main_controller.dart';

class StudentCardScreen extends StatelessWidget {
  StudentCardScreen({super.key});
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainController.isGuest.value == true ? appbarGuest() : appbar(),
      body: Obx(
        () =>
            mainController.isGuest.value == true ? guestCard() : studentCard(),
      ),
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
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: mainController.photo.value,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.cancel_outlined),
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
                            Text("${mainController.tcNumber}\n"),
                            Text("${mainController.studentNumber}\n"),
                            Text("${mainController.name}\n"),
                            Text(
                                " ${mainController.faculty}\n(${mainController.facultyEng})"),
                            Text(
                                " ${mainController.department}\n(${mainController.departmentEng})"),
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

  AppBar appbarGuest() {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title: const Text("Student Card"),
      centerTitle: true,
      automaticallyImplyLeading: false,
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
                () => mainController.isValid.value == true
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
