import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/routes/app_routes.dart';

class ActivationCodeController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  final RxString otpCode = ''.obs;
  final RxBool isCodeComplete = false.obs;

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }

  void onCodeChanged(String code) {
    otpCode.value = code;
    isCodeComplete.value = code.length == 6;
  }

  void verifyCode() {
    if (isCodeComplete.value) {
      Get.snackbar(
        backgroundColor: AppColors.fadeRedColor,
        'Success',
        'Code verified: ${otpCode.value}',
        snackPosition: SnackPosition.BOTTOM,
      );
      
      // Navigate to next screen
      // Get.offNamed(AppRoute.createAccount);
    } else {
      Get.snackbar(
        backgroundColor: AppColors.fadeRedColor,
        'Error',
        'Please enter complete 6-digit code',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void resendCode() {
    otpController.clear();
    otpCode.value = '';
    isCodeComplete.value = false;
    Get.snackbar(
      backgroundColor: AppColors.fadeRedColor,
      'Code Resent',
      'A new verification code has been sent',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
