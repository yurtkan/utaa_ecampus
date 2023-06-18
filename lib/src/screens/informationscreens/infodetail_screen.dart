import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:utaa_ecampus/src/controllers/info_controller.dart';
import 'package:utaa_ecampus/src/models/info.dart';

class InfoDetailScreen extends StatelessWidget {
  final InfoController infoController = Get.put(InfoController());
  InfoDetailScreen({Key? key, required this.info}) : super(key: key);

  final Info info;

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: pageTitle(),
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  Text pageTitle() {
    if (info.type == "news") {
      return const Text(
        "News Detail",
        style: TextStyle(
          color: Colors.black,
        ),
      );
    } else if (info.type == "announcement") {
      return const Text(
        "Announcement Detail",
        style: TextStyle(
          color: Colors.black,
        ),
      );
    } else if (info.type == "event") {
      return const Text(
        "Event Detail",
        style: TextStyle(
          color: Colors.black,
        ),
      );
    } else {
      return const Text(
        "Detail",
        style: TextStyle(
          color: Colors.black,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            info.image != 'null'
                ? CachedNetworkImage(
                    width: width,
                    height: height * 0.4,
                    fit: BoxFit.cover,
                    imageUrl: info.image,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.cancel_outlined),
                  )
                : Image(
                    width: width,
                    height: height * 0.4,
                    image: const AssetImage('assets/images/plane-bg.jpg'),
                    fit: BoxFit.cover,
                  ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      info.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      info.date,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      info.text,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: width * 0.9,
              child: ElevatedButton(
                onPressed: info.link != 'null'
                    ? () async {
                        if (await canLaunchUrlString(info.link)) {
                          await launchUrlString(info.link);
                        } else {
                          Get.snackbar(
                            "Error",
                            "Could not go to the source",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      }
                    : null,
                child: const Text(
                  "Go to the source",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
