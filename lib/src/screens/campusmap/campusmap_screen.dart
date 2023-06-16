import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampusMapScreen extends StatefulWidget {
  const CampusMapScreen({super.key});
  @override
  State<CampusMapScreen> createState() => _CampusMapScreenState();
}

class _CampusMapScreenState extends State<CampusMapScreen> {
  LatLng initialLocation = const LatLng(39.945700, 32.687591);
// ToDo: add custom marker

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SizedBox(
        width: Get.width,
        height: Get.height * 0.3,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: initialLocation,
            zoom: 16.5,
            tilt: 45,
          ),
          mapType: MapType.hybrid,
          markers: {
            Marker(
              markerId: const MarkerId("FacultyBuilding"),
              position: const LatLng(39.944915, 32.688931),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
            ),
            Marker(
              markerId: const MarkerId("FacultyofEngineering"),
              position: const LatLng(39.945614, 32.688888),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
            ),
            Marker(
              markerId: const MarkerId("Library"),
              position: const LatLng(39.945655, 32.689843),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
            ),
            Marker(
              markerId: const MarkerId("AdministrationBuilding"),
              position: const LatLng(39.945264, 32.686093),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
            ),
            Marker(
              markerId: const MarkerId("StudentAffairsBuilding"),
              position: const LatLng(39.945450, 32.6872000),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
            ),
            Marker(
              markerId: const MarkerId("Cafeteria"),
              position: const LatLng(39.945895, 32.686543),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
            ),
            Marker(
              markerId: const MarkerId("SportsHall"),
              position: const LatLng(39.947510, 32.685779),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
            ),
            Marker(
              markerId: const MarkerId("FacultyofAirTransportation"),
              position: const LatLng(39.947347, 32.686047),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
            ),
            Marker(
              markerId: const MarkerId("RectorsOffice"),
              position: const LatLng(39.946302, 32.687115),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
            ),
            Marker(
              markerId: const MarkerId("DiningHall"),
              position: const LatLng(39.946784, 32.685753),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
            ),
          },
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
        'Campus Map',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
