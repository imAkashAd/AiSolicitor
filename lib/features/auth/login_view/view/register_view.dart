import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/common/widgets/custom_button.dart';
import 'package:ryanlord/core/common/widgets/custom_textfield.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/features/auth/login_view/controller/register_view_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:ryanlord/routes/app_routes.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginWithGoogleController());
    
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
                        text: 'Enter your Gmail Address',
                        textColor: AppColors.whiteColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextProperty(
                        text: 'We will send a verification code to confirm Gmail address',
                        textColor: AppColors.primaryGreyText,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 40.h),
                      TextProperty(
                        text: 'E-mail',
                        textColor: AppColors.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 8.h,),
                    CustomTextfield(
                      controller: controller.emailController,
                      fieldText: 'Enter your email address'),
                      SizedBox(height: 20.h),
                      TextProperty(
                        text: 'Phone Number',
                        textColor: AppColors.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 8.h,),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.secondaryBackgroundColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: CountryCodePicker(
                            onChanged: (country) {
                              controller.onCountryCodeChanged(country.dialCode ?? '+880');
                            },
                            initialSelection: 'BD',
                            favorite: ['+880', 'BD'],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                            textStyle: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: CustomTextfield(
                            controller: controller.phoneController,
                            fieldText: '1234 567 8900',
                            keyboardType: TextInputType.phone,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1.h,
                          width: 120.w,
                          color: AppColors.whiteColor,
                        ),
                        TextProperty(text: '   or   ', textColor: AppColors.whiteColor, fontSize: 12.sp, fontWeight: FontWeight.w400),
                        Container(
                          height: 1.h,
                          width: 120.w,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                
                    SizedBox(height: 40.h),
                    Obx(() => CustomButton(
                      borderColor: AppColors.whiteColor,
                      color: Colors.transparent,
                      suffImagePath: IconPath.google,
                      iconSize: 20.h,
                      text: controller.isLoading.value 
                        ? 'Signing in...' 
                        : 'Continue with Google',
                      onTap: () => controller.signInWithGoogle(),
                    )),
                    SizedBox(height: 60.h),
                    CustomButton(
                      color: AppColors.blueText,
                      iconSize: 20.h,
                      text: 'Continue',
                      onTap: () => controller.continueWithEmailPhone(),
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
