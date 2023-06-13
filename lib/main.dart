import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utaa_ecampus/core/routes.dart';
import 'package:utaa_ecampus/src/screens/notfoundscreen/not_found_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  String? token = GetStorage().read('token');
  String sroute = '/notfound';
  if (token == null) {
    sroute = '/welcome';
  } else {
    sroute = '/mainscreen';
  }
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      GetMaterialApp(
        title: 'UTAA eCampus',
        debugShowCheckedModeBanner: false,
        //home: TestPage(),
        unknownRoute: GetPage(
          name: '/notfound',
          page: () => const NotFoundScreen(),
        ),
        initialRoute: sroute,
        getPages: Routes.routes,
      ),
    ),
  );
}
