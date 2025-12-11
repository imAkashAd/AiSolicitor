import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ryanlord/features/tab_views/message_view/widget/block_confirm_dialog.dart';

class BlockedChatController extends GetxController {
  final messageController = TextEditingController();
  final isBlocked = true.obs;

  void showBlockDialog() {
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

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
