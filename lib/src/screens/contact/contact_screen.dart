import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utaa_ecampus/src/controllers/contact_controller.dart';

class ContactScreen extends StatelessWidget {
  final ContactController contactController = Get.put(ContactController());
  ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(
              Icons.mail,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact Form',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'You can contact us for any questions or suggestions',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: contactController.titlefield,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: contactController.textfield,
                maxLines: 10,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Text',
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (contactController.titlefield.text.isNotEmpty ||
                    contactController.textfield.text.isNotEmpty) {
                  contactController.contactAPI();
                } else {
                  Get.snackbar('Contact Form', 'Please fill all fields',
                      colorText: Colors.white, backgroundColor: Colors.red);
                }
              },
              child: const Text('Send'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Get.back();
        },
      ),
      centerTitle: true,
      title: const Text(
        'Contact Form',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
