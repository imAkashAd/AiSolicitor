import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/common/widgets/custom_button.dart';
import 'package:ryanlord/core/common/widgets/custom_textfield.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/features/auth/login_view/controller/create_account_controller.dart';
import 'package:ryanlord/routes/app_routes.dart';
import 'dart:io';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateAccountController());
    
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 80.h, 20.w, 30.h),
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
                        text: 'Create Account',
                        textColor: AppColors.whiteColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextProperty(
                        text: 'Join us in just a few seconds and unlock \npersonalized experience made just for you.',
                        textColor: AppColors.primaryGreyText,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 40.h),
                      TextProperty(
                        text: 'Full Name',
                        textColor: AppColors.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 8.h,),
                    CustomTextfield(
                      controller: controller.fullNameController,
                      fieldText: 'Enter your full name'),
                      SizedBox(height: 20.h),
                      TextProperty(
                        text: 'Date of Birth',
                        textColor: AppColors.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 8.h,),
                    GestureDetector(
                      onTap: () => controller.selectDateOfBirth(context),
                      child: AbsorbPointer(
                        child: CustomTextfield(
                          controller: controller.dobController,
                          fieldText: 'dd/mm/yyyy'),
                      ),
                    ),
                    SizedBox(height: 20.h),
                      TextProperty(
                        text: 'Profile Picture',
                        textColor: AppColors.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 8.h,),
                    Obx(() => GestureDetector(
                      onTap: controller.pickImage,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 30.h,
                          horizontal: 20.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBackgroundColor,
                          borderRadius: BorderRadius.circular(10.r),
                          image: controller.selectedImagePath.value.isNotEmpty
                            ? DecorationImage(
                                image: FileImage(File(controller.selectedImagePath.value)),
                                fit: BoxFit.cover,
                              )
                            : null,
                        ),
                        child: controller.selectedImagePath.value.isEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  IconPath.upload,
                                  height: 20.h,
                                  width: 20.w,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(height: 8.h),
                                TextProperty(
                                  text: 'Drop your files here',
                                  textColor: AppColors.hintTextColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            )
                          : null,
                      ),
                    )),
                    SizedBox(height: 40.h),
                    CustomButton(
                      color: AppColors.blueText,
                      iconSize: 20.h,
                      text: 'Continue',
                      onTap: controller.createAccount,
                    ),
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
