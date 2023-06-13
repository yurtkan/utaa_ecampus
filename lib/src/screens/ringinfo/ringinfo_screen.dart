// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class RingInfoScreen extends StatefulWidget {
  const RingInfoScreen({super.key});

  @override
  State<RingInfoScreen> createState() => _RingInfoScreenState();
}

class _RingInfoScreenState extends State<RingInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Ring Info"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              children: [
                const Text(
                  "Ring Info",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nisi eget nunc ultricies aliquet. Donec euismod, nisl eget ultricies ultrices, nisl nisl aliquam nisl, vitae aliquam nisl nisl vitae nisl. Donec euismod, nisl eget ultricies ultrices, nisl nisl aliquam nisl, vitae aliquam nisl nisl vitae nisl. Donec euismod, nisl eget ultricies ultrices, nisl nisl aliquam nisl, vitae aliquam nisl nisl vitae nisl. Donec euismod, nisl eget ultricies ultrices, nisl nisl aliquam nisl, vitae aliquam nisl nisl vitae nisl. ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
