import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/common/widgets/custom_button.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/routes/app_routes.dart';

class AllowEssentialsView extends StatelessWidget {
  const AllowEssentialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 80.h,
                      horizontal: 24.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryBackgroundColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextProperty(
                          text: 'Allow Essential Permissions',
                          textColor: AppColors.whiteColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12.h),
                        TextProperty(
                          text:
                              'To give you the best experience, we need a few\npermissions.',
                          textColor: AppColors.primaryGreyText,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 120.h),
                        CustomButton(
                          text: 'Continue',
                          onTap: () {
                            Get.toNamed(AppRoute.notificationPermissionView);
                          },
                        ),
                      ],
                    ),
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
      ),
    );
  }
}
