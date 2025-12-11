import 'package:get/get.dart';

class MessageCustomTabbarWidgetController extends GetxController {
  var selectedTabIndex = 0.obs;

  var selectedTabs = ['All', 'Allowed', 'Blocked'].obs;

  void selectTab(int index) {
    selectedTabIndex.value = index;
  }
}
