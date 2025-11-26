import 'package:get/get.dart';
import 'package:ryanlord/routes/app_routes.dart';

class SplashViewController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToRegister();
  }

  void _navigateToRegister() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoute.registerView);
    });
  }
}