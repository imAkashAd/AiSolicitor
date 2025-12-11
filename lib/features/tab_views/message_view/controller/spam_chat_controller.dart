import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ryanlord/features/tab_views/message_view/widget/block_confirm_dialog.dart';

class SpamChatController extends GetxController {
  final messageController = TextEditingController();
  final messages = <Map<String, dynamic>>[].obs;
  final isBlocked = false.obs;

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

  void showBlockConfirmDialog() {
    Get.dialog(
      BlockConfirmDialog(
        onConfirm: () {
          Get.back();
          isBlocked.value = true;
          showBlockedConfirmedDialog();
        },
      ),
      barrierDismissible: false,
    );
  }

  void showBlockedConfirmedDialog() {
    Get.dialog(
      BlockedConfirmedDialog(),
      barrierDismissible: false,
    );

    Future.delayed(Duration(seconds: 2), () {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
    });
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
