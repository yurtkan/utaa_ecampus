import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  children: const <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        child: Image(
                          image: AssetImage('assets/images/logo/logo.png'),
                          height: 80,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Row(),
                    Placeholder(),
                    SizedBox(
                      height: 10,
                    ),
                    //Row(),
                    Placeholder(),
                    SizedBox(
                      height: 10,
                    ),
                    //Row(),
                    Placeholder(),
                    SizedBox(
                      height: 10,
                    ),
                    //Row(),
                    Placeholder(),
                    SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.menu, color: Colors.black),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.white, // <-- Button color
                      foregroundColor: Colors.blue, // <-- Splash color
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.notifications, color: Colors.black),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.white, // <-- Button color
                      foregroundColor: Colors.blue, // <-- Splash color
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
