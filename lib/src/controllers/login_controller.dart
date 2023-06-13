import 'package:get/get.dart';

class LoginController extends GetxController {
  bool _passwordVisible = false;

  @override
  void onInit() {
    _passwordVisible = false;
    super.onInit();
  }

  bool get passwordVisible => _passwordVisible;

  void togglePasswordVisibility() {
    _passwordVisible = !_passwordVisible;
    update();
  }
}
