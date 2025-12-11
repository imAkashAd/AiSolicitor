import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllowedChatController extends GetxController {
  final messageController = TextEditingController();
  final messages = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load initial messages
    messages.addAll([
      {
        'text': 'Where are you ?',
        'time': 'Today,10:23 AM',
        'isSent': false,
      },
      {
        'text': 'Can you help me about your location?',
        'time': 'Today,10:40 AM',
        'isSent': false,
      },
    ]);
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;
    messages.add({
      'text': text,
      'time': 'Now',
      'isSent': true,
    });
    messageController.clear();
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
