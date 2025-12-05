import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ryanlord/routes/app_routes.dart';
import 'package:ryanlord/services/call_services.dart';

class CallController extends GetxController {
  final RxString callerName = ''.obs;
  final RxString callerNumber = ''.obs;
  final RxString callerImage = ''.obs;
  final RxBool isCallActive = false.obs;
  final RxBool isMuted = false.obs;
  final RxBool isSpeakerOn = false.obs;
  final RxString callDuration = '00:00:00'.obs;
  
  Timer? _callTimer;
  int _seconds = 0;

  @override
  void onClose() {
    _callTimer?.cancel();
    super.onClose();
  }

  void startCall(String name, String number, {String? image}) {
    callerName.value = name;
    callerNumber.value = number;
    callerImage.value = image ?? '';
    isCallActive.value = true;
    _startCallTimer();
    Get.toNamed(AppRoute.ongoingCallView);
  }

  void _startCallTimer() {
    _seconds = 0;
    _callTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds++;
      final hours = (_seconds ~/ 3600).toString().padLeft(2, '0');
      final minutes = ((_seconds % 3600) ~/ 60).toString().padLeft(2, '0');
      final secs = (_seconds % 60).toString().padLeft(2, '0');
      callDuration.value = '$hours:$minutes:$secs';
    });
  }

  void endCall() async {
    _callTimer?.cancel();
    isCallActive.value = false;
    _seconds = 0;
    callDuration.value = '00:00:00';
    await CallService.endCall();
    Get.back();
  }

  void toggleMute() async {
    isMuted.value = !isMuted.value;
    await CallService.toggleMute(isMuted.value);
  }

  void toggleSpeaker() async {
    isSpeakerOn.value = !isSpeakerOn.value;
    await CallService.toggleSpeaker(isSpeakerOn.value);
  }

  void answerCall() async {
    isCallActive.value = true;
    _startCallTimer();
    await CallService.answerCall();
    Get.offNamed(AppRoute.ongoingCallView);
  }

  void declineCall() async {
    await CallService.endCall();
    Get.back();
  }
}