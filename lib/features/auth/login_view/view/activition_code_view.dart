import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:ryanlord/core/common/widgets/custom_button.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/features/auth/login_view/controller/activation_code_controller.dart';
import 'package:ryanlord/routes/app_routes.dart';

class ActivitionCodeView extends StatelessWidget {
  const ActivitionCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ActivationCodeController());
    
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 100.h, 20.w, 30.h),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: TextProperty(
                        text: 'Verification Code',
                        textColor: AppColors.whiteColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Align(
                      alignment: Alignment.center,
                      child: TextProperty(
                        textAlign: TextAlign.center,
                        text:
                            'Enter the verification code we just sent you on your e-mail address ',
                        textColor: AppColors.primaryGreyText,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Center(
                      child: Pinput(
                        length: 6,
                        controller: controller.otpController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        defaultPinTheme: PinTheme(
                          width: 48.w,
                          height: 48.h,
                          textStyle: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryBackgroundColor,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppColors.blueText),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 48.w,
                          height: 48.h,
                          textStyle: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryBackgroundColor,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppColors.blueText, width: 2),
                          ),
                        ),
                        onChanged: (value) {
                          controller.onCodeChanged(value);
                        },
                        onCompleted: (value) {
                          controller.onCodeChanged(value);
                          controller.verifyCode();
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'If you don\'t receive a code! ',
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryGreyText,
                            ),
                          ),
                          TextSpan(
                            text: 'Resend',
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blueText,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.snackbar(
                                  'Resend Code',
                                  'A new activation code has been sent to your number.',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppColors.fadeRedColor,
                                  colorText: AppColors.primaryGreyText,
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 240.h),
                    Obx(() => CustomButton(
                      text: 'Confirm',
                      color: controller.isCodeComplete.value 
                        ? AppColors.blueText 
                        : AppColors.primaryGreyText.withOpacity(0.5),
                      onTap: () {
                        if (controller.isCodeComplete.value) {
                          controller.verifyCode();
                          Get.toNamed(AppRoute.createAccount);
                        } else {
                          Get.snackbar(
                            backgroundColor: AppColors.fadeRedColor,
                            'Error',
                            'Please enter complete 6-digit code',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                    )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                text: 'By using Ai Solicitor, you agree to the\n',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryGreyText,
                ),
                children: [
                  TextSpan(
                    text: 'Terms',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.fadeRedColor.withOpacity(0.6),
                      decoration: TextDecoration.underline
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      Get.snackbar(
                        backgroundColor: AppColors.fadeRedColor,
                        'Terms', 'Terms Clicked');
                    }
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryGreyText,
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy.',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.fadeRedColor.withOpacity(0.6),
                      decoration: TextDecoration.underline
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      Get.snackbar(
                        backgroundColor: AppColors.fadeRedColor,
                        'Privacy Policy', 'Privacy Policy Clicked');
                    }
                  ),
                ],
              ))
            ),
          ],
        ),
      ),
    );
  }
}
