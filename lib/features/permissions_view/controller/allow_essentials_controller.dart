import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/routes/app_routes.dart';

class AllowEssentialsController extends GetxController {
  final RxInt currentStep = 0.obs;
  final RxBool isLoading = false.obs;

  final List<PermissionStep> permissions = [
    PermissionStep(
      title: 'Allow Essential Permissions',
      description: 'To give you the best experience, we need a few\npermissions.',
      icon: 'essential',
      permission: null, // No specific permission, just intro screen
    ),
    PermissionStep(
      title: 'Important alerts & reminders',
      description: 'To give you the best experience, we need a few\npermissions.',
      icon: 'notification',
      permission: Permission.notification,
    ),
    PermissionStep(
      title: 'To upload files and access\nsaved documents',
      description: 'To give you the best experience, we need a few\npermissions.',
      icon: 'storage',
      permission: Permission.storage,
    ),
    PermissionStep(
      title: 'To use voice commands or\nrecord audio',
      description: 'To give you the best experience, we need a few\npermissions.',
      icon: 'microphone',
      permission: Permission.microphone,
    ),
    PermissionStep(
      title: 'To scan documents or\ncapture images',
      description: 'To give you the best experience, we need a few\npermissions.',
      icon: 'camera',
      permission: Permission.camera,
    ),
  ];

  void requestCurrentPermission() async {
    if (currentStep.value >= permissions.length) {
      navigateToHome();
      return;
    }

    // If it's the first screen (essential permissions intro), just move to next
    if (permissions[currentStep.value].permission == null) {
      nextStep();
      return;
    }

    isLoading.value = true;

    try {
      final permission = permissions[currentStep.value].permission!;
      final status = await permission.request();

      if (status.isGranted) {
        Get.snackbar(
          backgroundColor: AppColors.fadeRedColor,
          'Success',
          '${permissions[currentStep.value].title} permission granted',
          snackPosition: SnackPosition.BOTTOM,
        );
        nextStep();
      } else if (status.isDenied) {
        Get.snackbar(
          backgroundColor: AppColors.fadeRedColor,
          'Permission Denied',
          'You can enable it later in settings',
          snackPosition: SnackPosition.BOTTOM,
        );
        nextStep();
      } else if (status.isPermanentlyDenied) {
        Get.snackbar(
          backgroundColor: AppColors.fadeRedColor,
          'Permission Required',
          'Please enable permission from settings',
          snackPosition: SnackPosition.BOTTOM,
        );
        await openAppSettings();
      }
    } catch (e) {
      Get.snackbar(
        backgroundColor: AppColors.fadeRedColor,
        'Error',
        'Failed to request permission: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void skipCurrentPermission() {
    if (permissions[currentStep.value].permission == null) {
      
      nextStep();
    } else {
      
      nextStep();
    }
  }

  void skipAllPermissions() {
    
    navigateToHome();
  }

  void nextStep() {
    if (currentStep.value < permissions.length - 1) {
      currentStep.value++;
    } else {
      navigateToHome();
    }
  }

  void navigateToHome() {
    
    Get.offAllNamed(AppRoute.customerBottomNavigationView);
  }
}

class PermissionStep {
  final String title;
  final String description;
  final String icon;
  final Permission? permission;

  PermissionStep({
    required this.title,
    required this.description,
    required this.icon,
    this.permission,
  });
}
