import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ryanlord/features/call_view/controller/call_controller.dart';
import 'package:ryanlord/routes/app_routes.dart';

class CallService {
  static const MethodChannel _channel = MethodChannel('com.example.ryanlord/calls');
  
  static Future<void> initialize() async {
    _channel.setMethodCallHandler(_handleMethodCall);
  }

  static Future<dynamic> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'onIncomingCall':
        final String phoneNumber = call.arguments['phoneNumber'] ?? 'Unknown';
        final String callerName = call.arguments['callerName'] ?? 'Unknown Caller';
        _handleIncomingCall(phoneNumber, callerName);
        break;
      case 'onCallStateChanged':
        final String state = call.arguments['state'];
        final String phoneNumber = call.arguments['phoneNumber'] ?? '';
        _handleCallStateChanged(state, phoneNumber);
        break;
      default:
        throw MissingPluginException('Not implemented: ${call.method}');
    }
  }

  static void _handleIncomingCall(String phoneNumber, String callerName) {
    final callController = Get.put(CallController());
    callController.callerNumber.value = phoneNumber;
    callController.callerName.value = callerName;
    Get.toNamed(AppRoute.incomingCallView);
  }

  static void _handleCallStateChanged(String state, String phoneNumber) {
    try {
      final callController = Get.find<CallController>();
      
      switch (state) {
        case 'RINGING':
          break;
        case 'OFFHOOK':
          // Call is active - already showing custom screen
          break;
        case 'IDLE':
          if (callController.isCallActive.value) {
            callController.endCall();
          }
          break;
      }
    } catch (e) {
      print('CallController not found: $e');
    }
  }

  static Future<void> makeCallInBackground(String phoneNumber) async {
    try {
      await _channel.invokeMethod('makeCall', {'phoneNumber': phoneNumber});
    } catch (e) {
      print('Error making call: $e');
    }
  }

  static Future<void> answerCall() async {
    try {
      await _channel.invokeMethod('answerCall');
    } catch (e) {
      print('Error answering call: $e');
    }
  }

  static Future<void> endCall() async {
    try {
      await _channel.invokeMethod('endCall');
    } catch (e) {
      print('Error ending call: $e');
    }
  }

  static Future<void> toggleSpeaker(bool enable) async {
    try {
      await _channel.invokeMethod('toggleSpeaker', {'enable': enable});
    } catch (e) {
      print('Error toggling speaker: $e');
    }
  }

  static Future<void> toggleMute(bool mute) async {
    try {
      await _channel.invokeMethod('toggleMute', {'mute': mute});
    } catch (e) {
      print('Error toggling mute: $e');
    }
  }
}