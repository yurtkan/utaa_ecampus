import 'package:flutter/material.dart';

class StudentCardScreen extends StatefulWidget {
  const StudentCardScreen({super.key});

  @override
  State<StudentCardScreen> createState() => _StudentCardScreenState();
}

class _StudentCardScreenState extends State<StudentCardScreen> {
  final bool _isValid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                child: _isValid == true
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
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
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
                      //mainAxisAlignment: MainAxisAlignment.center,
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
                          child: const Icon(
                            Icons.account_box_outlined,
                            size: 100,
                            color: Colors.grey,
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
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("11111111111\n"),
                            Text("111111111\n"),
                            Text("John Doe\n"),
                            Text(
                                "Mühendislik Fakültesi\n(Faculty of Engineering)"),
                            Text(
                                "Bilgisayar Mühendisliği\n(Computer Engineering)"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
