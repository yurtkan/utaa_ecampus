import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Column(
            children: const <Widget>[
              Center(
                child: Image(
                  image: AssetImage('assets/images/logo/logo.png'),
                  height: 100,
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
            ],
          ),
        ),
      ),
    );
  }
}
