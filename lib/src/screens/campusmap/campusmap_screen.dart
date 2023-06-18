import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utaa_ecampus/src/models/places.dart';

class CampusMapScreen extends StatefulWidget {
  const CampusMapScreen({super.key});
  @override
  State<CampusMapScreen> createState() => _CampusMapScreenState();
}

class _CampusMapScreenState extends State<CampusMapScreen> {
  final searchController = TextEditingController();
  List<Places> places = allPlaces;
  LatLng initialLocation = const LatLng(39.946000, 32.687591);
  //final Places places;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height * 0.25,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: initialLocation,
                zoom: 16,
                tilt: 45,
              ),
              mapType: MapType.hybrid,
              markers: markerList,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.circle,
                      size: 15,
                      color: Colors.green,
                    )),
                    TextSpan(
                      text: 'Faculty Building Hayati Yazıcı',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.circle,
                      size: 15,
                      color: Colors.blue,
                    )),
                    TextSpan(
                      text: 'Faculty of Airtransportation',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                    child: Icon(
                  Icons.circle,
                  size: 15,
                  color: Colors.red,
                )),
                TextSpan(
                  text:
                      'Faculty of Aeronautics and Astronautics / Faculty of Engineering',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.circle,
                      size: 15,
                      color: Colors.orange,
                    )),
                    TextSpan(
                      text: 'Library',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.circle,
                      size: 15,
                      color: Colors.purple,
                    )),
                    TextSpan(
                      text: 'Administrative Building',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.circle,
                      size: 15,
                      color: Colors.yellow,
                    )),
                    TextSpan(
                      text: 'Student Affairs',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.circle,
                      size: 15,
                      color: Colors.cyan,
                    )),
                    TextSpan(
                      text: 'Rectorship',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.circle,
                      size: 15,
                      color: Colors.indigo,
                    )),
                    TextSpan(
                      text: 'Cafeteria',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.circle,
                      size: 15,
                      color: Colors.pink,
                    )),
                    TextSpan(
                      text: 'Dining Hall',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.circle,
                      size: 15,
                      color: Colors.redAccent,
                    )),
                    TextSpan(
                      text: 'Sports Hall',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Search',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
              onChanged: searchBook,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.location_on),
                  title: Text(places[index].name),
                  subtitle: Text(places[index].building),
                  onTap: null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Set<Marker> get markerList {
    return {
      Marker(
        markerId: const MarkerId("FacultyBuilding"),
        position: const LatLng(39.944915, 32.688931),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
      Marker(
        markerId: const MarkerId("FacultyofEngineering"),
        position: const LatLng(39.945614, 32.688888),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
      Marker(
        markerId: const MarkerId("Library"),
        position: const LatLng(39.945655, 32.689843),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ),
      Marker(
        markerId: const MarkerId("AdministrationBuilding"),
        position: const LatLng(39.945264, 32.686093),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ),
      Marker(
        markerId: const MarkerId("StudentAffairsBuilding"),
        position: const LatLng(39.945450, 32.6872000),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      ),
      Marker(
        markerId: const MarkerId("Cafeteria"),
        position: const LatLng(39.945895, 32.686543),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
      Marker(
        markerId: const MarkerId("SportsHall"),
        position: const LatLng(39.947510, 32.685779),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
      ),
      Marker(
        markerId: const MarkerId("FacultyofAirTransportation"),
        position: const LatLng(39.947347, 32.686047),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
      Marker(
        markerId: const MarkerId("RectorsOffice"),
        position: const LatLng(39.946302, 32.687115),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      ),
      Marker(
        markerId: const MarkerId("DiningHall"),
        position: const LatLng(39.946784, 32.685753),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      ),
    };
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

  void searchBook(String query) {
    final dummySearchList = allPlaces.where((place) {
      final nameLower = place.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();

    setState(() => places = dummySearchList);
  }
}
