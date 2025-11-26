import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/routes/app_routes.dart';

class CreateAccountController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  
  final RxString selectedImagePath = ''.obs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onClose() {
    fullNameController.dispose();
    dobController.dispose();
    super.onClose();
  }

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      
      if (image != null) {
        selectedImagePath.value = image.path;
        Get.snackbar(
          backgroundColor: AppColors.fadeRedColor,
          'Success',
          'Image selected successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        backgroundColor: AppColors.fadeRedColor,
        'Error',
        'Failed to pick image: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> selectDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 6570)), // 18 years ago
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.blueText,
              surface: AppColors.secondaryBackgroundColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      dobController.text = '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
    }
  }

  void createAccount() {
    final fullName = fullNameController.text.trim();
    final dob = dobController.text.trim();

    if (fullName.isEmpty) {
      Get.snackbar(
        backgroundColor: AppColors.fadeRedColor,
        'Error',
        'Please enter your full name',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (dob.isEmpty) {
      Get.snackbar(
        backgroundColor: AppColors.fadeRedColor,
        'Error',
        'Please select your date of birth',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (selectedImagePath.value.isEmpty) {
      Get.snackbar(
        backgroundColor: AppColors.fadeRedColor,
        'Error',
        'Please upload your profile picture',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Account creation successful
    Get.snackbar(
      backgroundColor: AppColors.fadeRedColor,
      'Success',
      'Account created successfully',
      snackPosition: SnackPosition.BOTTOM,
    );

    // Navigate to next screen
    Get.offNamed(AppRoute.allowEssentialsView);
  }
}