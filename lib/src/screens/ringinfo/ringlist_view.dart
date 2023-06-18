import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:utaa_ecampus/src/controllers/ring_controller.dart';
import 'package:utaa_ecampus/src/models/ring.dart';

final RingController ringController = Get.put(RingController());

class RingListView extends StatelessWidget {
  const RingListView({
    Key? key,
    required this.rings,
  }) : super(key: key);

  final List<Ring> rings;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 10, right: 10),
      scrollDirection: Axis.vertical,
      itemCount: rings.length,
      itemBuilder: (_, index) {
        Ring ring = rings[index];
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 4,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Column(
                    children: [
                      Text(
                        ring.ringname,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                        ),
                        child: Container(
                          height: 2,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: Colors.black,
                                width: 100,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'From First Stop',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ring.ringtouniv,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'From University',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ring.ringfromuniv,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        height: 1,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.fromBorderSide(
                            BorderSide(
                              color: Colors.black,
                              width: 100,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Ring Stops',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        ring.ringstops,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (_, __) {
        return const Padding(padding: EdgeInsets.only(right: 50));
      },
    );
  }
}
