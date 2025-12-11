import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/common/widgets/custom_app_bar.dart';
import 'package:ryanlord/core/common/widgets/custom_button.dart';
import 'package:ryanlord/core/common/widgets/custom_textfield.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/features/tab_views/profile_view/controller/profile_controller.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: CustomAppBar(
        title: '',
        homePage: false,
        callStatus: IconPath.saveChanges,
        onEditTap: () => controller.saveProfile(),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    showImageUploadPopup(context, controller);
                  },
                  child: Stack(
                    children: [
                      Obx(() => CircleAvatar(
                        radius: 60.w,
                        backgroundImage: controller.profileImage.value != null
                            ? FileImage(controller.profileImage.value!)
                            : AssetImage(IconPath.avatar) as ImageProvider,
                      )),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Image.asset(
                          IconPath.upProfile,
                          width: 30.w,
                          height: 30.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 40.h)),
              TextProperty(
                text: 'Name',
                textColor: AppColors.whiteColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 8.h),
              CustomTextfield(
                controller: controller.nameController,
                fillColor: AppColors.fadeBlackColor.withOpacity(0.2),
                fieldText: 'Enter your name',
              ),
              SizedBox(height: 20.h),
              TextProperty(
                text: 'Email',
                textColor: AppColors.whiteColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 8.h),
              CustomTextfield(
                controller: controller.emailController,
                fillColor: AppColors.fadeBlackColor.withOpacity(0.2),
                fieldText: 'abc@example.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}



void showImageUploadPopup(BuildContext context, ProfileController controller) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black.withOpacity(0.3),
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
          contentPadding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
          backgroundColor: AppColors.secondaryGreyText.withOpacity(0.1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          
          content: GestureDetector(
            onTap: () => controller.pickImage(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h), // inner container padding
              decoration: BoxDecoration(
                color: AppColors.primaryGreenColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.file_upload_outlined, size: 30.w, color: AppColors.whiteColor),
                  SizedBox(width: 16.w),
                  TextProperty(
                    text: 'Upload Photo',
                    textColor: AppColors.whiteColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}










// void showImageUploadPopup(BuildContext context) {
//   showDialog(
//     context: context,
//     barrierDismissible: true,
//     barrierLabel: '',
//     barrierColor: AppColors.primaryBackgroundColor.withOpacity(0.5),
//     builder: (context) {
//       return AlertDialog(
//         contentPadding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
//         backgroundColor: AppColors.primaryBackgroundColor.withOpacity(0.5),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         content: Container(
//           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//           decoration: BoxDecoration(
//             color: AppColors.primaryGreenColor,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.file_upload_outlined, size: 30.w, color: AppColors.whiteColor),
//               SizedBox(width: 16.w),
//               TextProperty(
//                 text: 'Upload Photo',
//                 textColor: AppColors.whiteColor,
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//             ],
//           ),
//         )
//       );
//     },
//   );
// }
