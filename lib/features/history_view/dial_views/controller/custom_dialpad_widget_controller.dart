import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/features/call_view/controller/call_controller.dart';
import 'package:ryanlord/services/call_services.dart';

class CustomDialpadWidgetController extends GetxController {
  RxString phoneNumber = "".obs;

  void addDigit(String d) {
    if (phoneNumber.value.length < 15) {
      phoneNumber.value += d;
    }
  }

  void deleteDigit() {
    if (phoneNumber.isNotEmpty) {
      phoneNumber.value = phoneNumber.value.substring(0, phoneNumber.value.length - 1);
    }
  }

  void clear() {
    phoneNumber.value = "";
  }

  void makeCall() async {
    if (phoneNumber.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter a phone number',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.fadeRedColor,
        colorText: Colors.white,
      );
      return;
    }

    // Show custom ongoing call screen first
    final callController = Get.put(CallController());
    callController.startCall('Unknown Caller', phoneNumber.value);
    
    // Then make actual call in background
    await CallService.makeCallInBackground(phoneNumber.value);
  }
}