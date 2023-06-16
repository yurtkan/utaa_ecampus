import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:utaa_ecampus/src/controllers/announcements_controller.dart';
import 'package:utaa_ecampus/src/models/announcements.dart';

final AnnouncementsController controller = Get.put(AnnouncementsController());

class AnnouncementsListView extends StatelessWidget {
  const AnnouncementsListView({
    Key? key,
    required this.announcements,
  }) : super(key: key);

  final List<Announcements> announcements;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 10, right: 10),
        scrollDirection: Axis.vertical,
        itemCount: announcements.length,
        itemBuilder: (_, index) {
          Announcements _announcement = announcements[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 160,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Placeholder(),
            ),
          );
        },
        separatorBuilder: (_, __) {
          return const Padding(padding: EdgeInsets.only(right: 50));
        },
      ),
    );
  }
}
