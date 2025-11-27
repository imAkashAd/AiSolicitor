import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/common/widgets/custom_button.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/routes/app_routes.dart';
import 'package:ryanlord/features/permissions_view/controller/allow_essentials_controller.dart';

class AllowEssentialsView extends StatelessWidget {
  const AllowEssentialsView({super.key});

  IconData _getIconForStep(String iconName) {
    switch (iconName) {
      case 'notification':
        return Icons.notifications;
      case 'storage':
        return Icons.folder;
      case 'microphone':
        return Icons.mic;
      case 'camera':
        return Icons.camera_alt;
      default:
        return Icons.info;
    }
  }

  String _getButtonText(String icon) {
    if (icon == 'essential') return 'Continue';
    if (icon == 'notification') return 'Allow Notifications';
    if (icon == 'storage') return 'Allow Storage';
    if (icon == 'microphone') return 'Allow Microphone';
    if (icon == 'camera') return 'Allow Camera';
    return 'Continue';
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllowEssentialsController());
    
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
                  child: Obx(() {
                    if (controller.currentStep.value >= controller.permissions.length) {
                      return Container();
                    }
                    
                    final step = controller.permissions[controller.currentStep.value];
                    
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 40.h,
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
                            text: step.title,
                            textColor: AppColors.whiteColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 12.h),
                          TextProperty(
                            text: step.description,
                            textColor: AppColors.primaryGreyText,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center,
                          ),
                          if (step.icon != 'essential') ...[
                            SizedBox(height: 60.h),
                            Icon(
                              _getIconForStep(step.icon),
                              size: 80.sp,
                              color: AppColors.whiteColor,
                            ),
                            SizedBox(height: 60.h),
                          ] else ...[
                            SizedBox(height: 120.h),
                          ],
                          Obx(() => CustomButton(
                            text: controller.isLoading.value 
                              ? 'Processing...' 
                              : _getButtonText(step.icon),
                            onTap: () {
                              if (!controller.isLoading.value) {
                                controller.requestCurrentPermission();
                              }
                            },
                          )),
                          SizedBox(height: 20.h),
                          CustomButton(
                            color: AppColors.secondaryBackgroundColor,
                            borderColor: AppColors.blueText,
                            text: 'Skip',
                            onTap: () {
                              controller.skipCurrentPermission();
                            },
                          ),
                        ],
                      ),
                    );
                  }),
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
