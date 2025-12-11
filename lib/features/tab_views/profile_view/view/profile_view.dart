import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ryanlord/core/common/widgets/custom_app_bar.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: CustomAppBar(
        title: '',
        homePage: false,
        callStatus: IconPath.editProfile,
      ),

      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60.w,
                      child: Image.asset(IconPath.avatar, width: 300.w),
                    ),
                    SizedBox(height: 20.h),
                    TextProperty(
                      text: 'Sarah Alexo',
                      textColor: AppColors.blueText,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8.h),
                    TextProperty(
                      text: '(+1) 123 456 7890',
                      textColor: AppColors.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: AppColors.blueText.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.verified, color: AppColors.blueText, size: 20.w),
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
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: AppColors.primaryGreenColor.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.save, color: AppColors.primaryGreenColor, size: 20.w),
                              SizedBox(width: 8.w),
                              TextProperty(
                            text: 'Privacy Sheild',
                            textColor: AppColors.primaryGreenColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                            ],
                          ),
                          SizedBox(width: 8.w),
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 40.h)),
              
            ],
          ),
        ),
      ),
    );
  }
}