import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BlockedMessageChatController extends GetxController {
  final messageController = TextEditingController();
  final messages = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    messages.addAll([
      {
        'text': 'You have won 2 Millons Dollars, Go to this link to claim it : www.bit83.com',
        'time': 'Today',
        'isSent': false,
      },
    ]);
  }

  void reportUser() {
    Get.snackbar(
      'Reported',
      'User has been reported successfully',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
