import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/common/controllers/custom_switch_controller.dart';
import 'package:ryanlord/core/common/widgets/custom_app_bar.dart';
import 'package:ryanlord/core/common/widgets/custom_button.dart';
import 'package:ryanlord/core/common/widgets/custom_switch.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/features/tab_views/profile_view/controller/profile_controller.dart';
import 'package:ryanlord/features/tab_views/profile_view/widget/legal_info_text_button.dart';
import 'package:ryanlord/features/tab_views/profile_view/widget/profile_button_widget.dart';
import 'package:ryanlord/routes/app_routes.dart';

class ProfileView extends StatelessWidget {
  final CustomSwitchController controller = Get.put(CustomSwitchController());
  final ProfileController profileController = Get.put(ProfileController());

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: CustomAppBar(
        title: '',
        homePage: false,
        callStatus: IconPath.editProfile,
        onEditTap: () {
          Get.toNamed(AppRoute.editProfileView);
        },
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Obx(() => CircleAvatar(
                      radius: 60.w,
                      backgroundImage: profileController.profileImage.value != null
                          ? FileImage(profileController.profileImage.value!)
                          : AssetImage(IconPath.avatar) as ImageProvider,
                    )),
                    SizedBox(height: 20.h),
                    Obx(() => TextProperty(
                      text: profileController.name.value,
                      textColor: AppColors.primaryGreenColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    )),
                    SizedBox(height: 4.h),
                    Obx(() => TextProperty(
                      text: profileController.email.value,
                      textColor: AppColors.whiteColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    )),
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.blueText.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.verified,
                            color: AppColors.blueText,
                            size: 20.w,
                          ),
                          SizedBox(width: 8.w),
                          TextProperty(
                            text: 'verified',
                            textColor: AppColors.whiteColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: AppColors.primaryGreenColor.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                IconPath.shield,
                                width: 20.w,
                                color: AppColors.primaryGreenColor,
                              ),
                              SizedBox(width: 8.w),
                              TextProperty(
                                text: 'Privacy Sheild',
                                textColor: AppColors.primaryGreenColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Obx(
                            () => CustomSwitch(
                              value: controller.difficultyEnabled.value,
                              onChanged: (bool value) {
                                controller.toggleDifficulty();
                              },
                            ),
                          ),
                          SizedBox(height: 16.h),
                          TextProperty(
                            text:
                                'Privacy Shield is active. Your call and message\n data is protected automatically.',
                            textColor: AppColors.whiteColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 40.h)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    IconPath.dataManage,
                    width: 20.w,
                    color: AppColors.primaryGreenColor,
                  ),
                  SizedBox(width: 8.w),
                  TextProperty(
                    text: 'Data Management',
                    textColor: AppColors.whiteColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20.h)),
              ProfileButtonWidget(
                iconPath: IconPath.export,
                title: 'Export Data',
                subtitle: 'Download your personal data (CSV/JSON format)',
                onTap: () {
                  
                },
              ),
              SizedBox(height: 8.h),
              ProfileButtonWidget(
                iconPath: IconPath.export,
                title: 'Manage Connected Apps',
                subtitle: 'Control third-party app permissions',
                onTap: () {
                  
                },
              ),
              SizedBox(height: 8.h),
              ProfileButtonWidget(
                iconPath: IconPath.export,
                title: 'Delete Account',
                subtitle: 'Permanently remove your account and data',
                onTap: () {
                  showImageUploadPopup(context);
                },
              ),
              SizedBox(height: 8.h),
              Padding(padding: EdgeInsets.only(top: 40.h)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    IconPath.legal,
                    width: 20.w,
                    color: AppColors.primaryGreenColor,
                  ),
                  SizedBox(width: 8.w),
                  TextProperty(
                    text: 'Legal Information',
                    textColor: AppColors.whiteColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20.h)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LegalInfoTextButton(text: 'Terms of Service',),
                  Padding(padding: EdgeInsets.only(right: 20.w)),
                  LegalInfoTextButton(text: 'Privacy Policy',),
                  Padding(padding: EdgeInsets.only(right: 20.w)),
                  LegalInfoTextButton(text: 'GDPR Info',),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LegalInfoTextButton(text: 'Data Processing Agreement',),
                  Padding(padding: EdgeInsets.only(right: 20.w)),
                  LegalInfoTextButton(text: 'Coockie Policy',),
                  Padding(padding: EdgeInsets.only(right: 20.w)),
                  LegalInfoTextButton(text: 'Legal Notice',),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



void showImageUploadPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black.withOpacity(0.3),
    builder: (context) {
      return Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),

          child: AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
            
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),

            backgroundColor: AppColors.secondaryBackgroundColor.withOpacity(0.8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image.asset(
                  IconPath.bin,
                  width: 50.w,
                  height: 50.h,
                ),

                SizedBox(height: 20.h),

                TextProperty(
                  text: 'Are you sure\nwant to delete?',
                  textColor: AppColors.whiteColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomButton(
                        borderColor: AppColors.primaryGreenColor,
                        color: Colors.transparent,
                        text: 'No',
                        onTap: () => Get.back(),
                      ),
                    ),

                    SizedBox(width: 12.w),

                    Expanded(
                      child: CustomButton(
                        borderColor: AppColors.primaryGreenColor,
                        color: AppColors.primaryGreenColor,
                        text: 'Yes',
                        onTap: () => Get.back(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
