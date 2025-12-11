import 'package:get/get.dart';

class CustomSwitchController extends GetxController {
  var difficultyEnabled = false.obs;
  var recomendationEnabled = false.obs;

  void toggleDifficulty() {
    difficultyEnabled.value = !difficultyEnabled.value;
  }
}