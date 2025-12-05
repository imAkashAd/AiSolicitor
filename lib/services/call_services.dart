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
        final bool isIncoming = call.arguments['isIncoming'] ?? false;
        final String? disconnectReason = call.arguments['disconnectReason'];
        final String? disconnectMessage = call.arguments['disconnectMessage'];
        _handleCallStateChanged(state, phoneNumber, isIncoming, disconnectReason, disconnectMessage);
        break;
      case 'onCallDetailsChanged':
        final String phoneNumber = call.arguments['phoneNumber'] ?? '';
        final String callerName = call.arguments['callerName'] ?? '';
        _handleCallDetailsChanged(phoneNumber, callerName);
        break;
      default:
        throw MissingPluginException('Not implemented: ${call.method}');
    }
  }

  static void _handleIncomingCall(String phoneNumber, String callerName) {
    final callController = Get.put(CallController());
    callController.callerNumber.value = phoneNumber;
    callController.callerName.value = callerName;
    callController.isCallActive.value = false;
    Get.toNamed(AppRoute.incomingCallView);
  }

  static void _handleCallDetailsChanged(String phoneNumber, String callerName) {
    try {
      final callController = Get.find<CallController>();
      if (phoneNumber.isNotEmpty) {
        callController.callerNumber.value = phoneNumber;
      }
      if (callerName.isNotEmpty && callerName != 'Unknown Caller') {
        callController.callerName.value = callerName;
      }
    } catch (e) {
      print('Error updating call details: $e');
    }
  }

  static void _handleCallStateChanged(
    String state, 
    String phoneNumber, 
    bool isIncoming,
    String? disconnectReason,
    String? disconnectMessage
  ) {
    print('Call state: $state, phone: $phoneNumber, incoming: $isIncoming, disconnect: $disconnectReason');
    
    try {
      final callController = Get.find<CallController>();
      
      switch (state) {
        case 'RINGING':
          if (isIncoming && Get.currentRoute != AppRoute.incomingCallView) {
            callController.callerNumber.value = phoneNumber;
            callController.callerName.value = 'Unknown Caller';
            callController.isCallActive.value = false;
            Get.toNamed(AppRoute.incomingCallView);
          }
          break;
          
        case 'DIALING':
          if (!isIncoming) {
            if (callController.callerNumber.value != phoneNumber) {
              callController.callerNumber.value = phoneNumber;
            }
          }
          break;
          
        case 'ACTIVE':
          if (!callController.isCallActive.value) {
            callController.isCallActive.value = true;
            callController.startCallTimer();
            
            if (Get.currentRoute != AppRoute.ongoingCallView) {
              Get.offNamed(AppRoute.ongoingCallView);
            }
          }
          break;
          
        case 'DISCONNECTED':
          // Show disconnect reason if available
          if (disconnectReason != null && disconnectReason != 'LOCAL' && disconnectReason != 'REMOTE') {
            _showDisconnectMessage(disconnectReason, disconnectMessage);
          }
          
          if (callController.isCallActive.value || 
              Get.currentRoute == AppRoute.incomingCallView || 
              Get.currentRoute == AppRoute.ongoingCallView) {
            callController.endCall();
          }
          break;
      }
    } catch (e) {
      print('Error handling call state: $e');
      if (state == 'RINGING' && isIncoming) {
        final callController = Get.put(CallController());
        callController.callerNumber.value = phoneNumber;
        callController.callerName.value = 'Unknown Caller';
        callController.isCallActive.value = false;
        Get.toNamed(AppRoute.incomingCallView);
      }
    }
  }

  static void _showDisconnectMessage(String reason, String? message) {
    String title = 'Call Ended';
    String body = '';
    Color backgroundColor = Colors.orange;
    
    switch (reason) {
      case 'BUSY':
        title = 'Line Busy';
        body = 'The number you are trying to reach is busy';
        break;
      case 'ERROR':
        title = 'Call Failed';
        body = message ?? 'Unable to complete the call. Please try again';
        backgroundColor = Colors.red;
        break;
      case 'REJECTED':
        title = 'Call Rejected';
        body = 'The call was rejected';
        backgroundColor = Colors.red;
        break;
      case 'RESTRICTED':
        title = 'Call Restricted';
        body = 'This number cannot be called';
        backgroundColor = Colors.red;
        break;
      case 'MISSED':
        title = 'Missed Call';
        body = 'Call was not answered';
        break;
      case 'NOT_SUPPORTED':
        title = 'Not Supported';
        body = 'This type of call is not supported';
        backgroundColor = Colors.red;
        break;
      case 'CANCELED':
        title = 'Call Canceled';
        body = 'The call was canceled';
        break;
      default:
        title = 'Call Ended';
        body = message ?? 'Call has ended';
    }
    
    if (body.isNotEmpty) {
      Get.snackbar(
        title,
        body,
        snackPosition: SnackPosition.TOP,
        backgroundColor: backgroundColor,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(16),
        borderRadius: 8,
      );
    }
  }

  static Future<bool> checkPermissions() async {
    try {
      final result = await _channel.invokeMethod('checkPermissions');
      return result == true;
    } catch (e) {
      print('Error checking permissions: $e');
      return false;
    }
  }

  static Future<void> requestPermissions() async {
    try {
      await _channel.invokeMethod('requestPermissions');
    } catch (e) {
      print('Error requesting permissions: $e');
    }
  }

  static Future<void> makeCall(String phoneNumber) async {
    try {
      final hasPermissions = await checkPermissions();
      if (!hasPermissions) {
        await requestPermissions();
        return;
      }
      
      await _channel.invokeMethod('makeCall', {'phoneNumber': phoneNumber});
    } catch (e) {
      print('Error making call: $e');
      Get.snackbar(
        'Error',
        'Failed to make call: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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