import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Color.fromARGB(255, 239, 239, 239),
        ),
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo/logow.png',
          fit: BoxFit.fitHeight,
          height: 80,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/plane-bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.40,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 0, 97, 161),
                    Color.fromARGB(255, 0, 109, 176),
                    Color.fromARGB(255, 0, 145, 228),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Welcome to',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'UTAA eCampus',
                    style: GoogleFonts.lato(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 50,
                    width: 280,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: GoogleFonts.lato(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        foregroundColor:
                            const Color.fromARGB(255, 101, 101, 101),
                        backgroundColor:
                            const Color.fromARGB(255, 239, 239, 239),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            //topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Please login for use all features.',
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      foregroundColor: const Color.fromARGB(255, 101, 101, 101),
                      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          //bottomLeft: Radius.circular(20),
                          //bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setGuest();
                      Get.offAllNamed('/mainscreen');
                    },
                    child: const Text('Continue without login'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void setGuest() {
    GetStorage().write('token', 'Guest');
    GetStorage().write('name', 'Guest');
    GetStorage().write('mail', 'Guest@Guest');
  }
}
