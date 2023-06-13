import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utaa_ecampus/src/screens/auth/login_screen.dart';
import 'package:utaa_ecampus/src/screens/auth/welcome_screen.dart';
import 'package:utaa_ecampus/src/screens/main_screen.dart';

class TestPage extends StatefulWidget {
  const TestPage({
    super.key,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.red,
          systemNavigationBarColor: Colors.white,
        ),
        elevation: 0,
        toolbarHeight: 200,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(size: 75, Icons.engineering),
            SizedBox(
              height: 10,
            ),
            Text(
              "Test Page",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                );
              },
              child: const Text('Welcome PAGE'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: const Text('Login PAGE'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                );
              },
              child: const Text('Main PAGE'),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
