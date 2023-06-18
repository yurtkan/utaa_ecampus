import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:utaa_ecampus/src/controllers/info_controller.dart';
import 'package:utaa_ecampus/src/models/info.dart';
import 'package:utaa_ecampus/src/screens/informationscreens/infodetail_screen.dart';

final InfoController infoController = Get.put(InfoController());

class InfoListView extends StatelessWidget {
  const InfoListView({
    Key? key,
    required this.infos,
  }) : super(key: key);

  final List<Info> infos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 30, right: 10, top: 10, bottom: 10),
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (_, index) {
        Info info = infos[index];
        return GestureDetector(
          onTap: () {
            Get.to(InfoDetailScreen(info: infos[index]));
          },
          child: Container(
            height: 150,
            width: 250,
            //padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 4,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                info.image != 'null'
                    ? CachedNetworkImage(
                        width: 250,
                        height: 100,
                        fit: BoxFit.cover,
                        imageUrl: info.image,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.cancel_outlined),
                      )
                    : const Image(
                        width: 250,
                        height: 100,
                        image: AssetImage('assets/images/plane-bg.jpg'),
                        fit: BoxFit.cover,
                      ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    strutStyle: const StrutStyle(fontSize: 15.0),
                    text: TextSpan(
                      text: info.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (_, __) {
        return const Padding(padding: EdgeInsets.only(right: 30));
      },
    );
  }
}
