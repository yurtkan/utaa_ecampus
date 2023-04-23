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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Column(
            children: <Widget>[
              const Center(
                child: Image(
                  image: AssetImage('assets/images/logo/logo.png'),
                  height: 100,
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Row(),
              Placeholder(),
            ],
          ),
        ),
      ),
    );
  }
}
