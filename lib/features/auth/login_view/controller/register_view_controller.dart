import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/routes/app_routes.dart';

class LoginWithGoogleController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var isLoading = false.obs;

  // Text controllers for form inputs
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final RxString countryCode = '+880'.obs;

  @override
  void onClose() {
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  void onCountryCodeChanged(String code) {
    countryCode.value = code;
  }

  Future<void> continueWithEmailPhone() async {
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();

    if (email.isEmpty) {
      Get.snackbar(
        backgroundColor: AppColors.fadeRedColor,
        'Error',
        'Please enter your email address',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (phone.isEmpty) {
      Get.snackbar(
        backgroundColor: AppColors.fadeRedColor,
        'Error',
        'Please enter your phone number',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Validate email format
    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        backgroundColor: AppColors.fadeRedColor,
        'Error',
        'Please enter a valid email address',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Send verification code
    Get.snackbar(
      backgroundColor: AppColors.fadeRedColor,
      'Success',
      'Verification code sent to $email',
      snackPosition: SnackPosition.BOTTOM,
    );

    // Navigate to activation code view
    Get.toNamed(AppRoute.activisionCodeView);
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;

      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the sign-in
        isLoading.value = false;
        return;
      }

      // Get authentication details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Get user information
      final String? email = googleUser.email;
      final String? displayName = googleUser.displayName;
      final String? photoUrl = googleUser.photoUrl;

      Get.snackbar(
        backgroundColor: AppColors.fadeRedColor,
        'Success',
        'Signed in as $displayName',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Navigate to home page
      // Get.offAllNamed(AppRoute.customerBottomNavigationView);

    } catch (error) {
      Get.snackbar(
        backgroundColor: AppColors.fadeRedColor,
        'Error',
        'Failed to sign in with Google: ${error.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}