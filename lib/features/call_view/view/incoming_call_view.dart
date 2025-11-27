import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/features/call_view/controller/call_controller.dart';

class IncomingCallView extends StatelessWidget {
  const IncomingCallView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CallController());
    
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 60.h),
            
            TextProperty(
              text: 'Incoming Call',
              textColor: AppColors.whiteColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            
            SizedBox(height: 40.h),
            
            // Caller avatar
            Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightWhiteColor,
              ),
              child: Icon(
                Icons.person,
                size: 60.sp,
                color: AppColors.whiteColor,
              ),
            ),
            
            SizedBox(height: 30.h),
            
            // Caller name
            Obx(() => TextProperty(
              text: controller.callerName.value,
              textColor: AppColors.whiteColor,
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
            )),
            
            SizedBox(height: 8.h),
            
            // Caller number
            Obx(() => TextProperty(
              text: controller.callerNumber.value,
              textColor: AppColors.primaryGreyText,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            )),
            
            SizedBox(height: 40.h),
            
            // Risk indicator
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.redColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: TextProperty(
                text: 'High Risk: 90%',
                textColor: AppColors.whiteColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            
            SizedBox(height: 20.h),
            
            // Deterrence Active banner
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.redColor2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.warning, color: AppColors.whiteColor, size: 20.sp),
                  SizedBox(width: 8.w),
                  TextProperty(
                    text: 'Deterrence Active',
                    textColor: AppColors.whiteColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            
            Spacer(),
            
            // Answer and Decline buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Decline button
                GestureDetector(
                  onTap: () => controller.declineCall(),
                  child: Column(
                    children: [
                      Container(
                        width: 70.w,
                        height: 70.w,
                        decoration: BoxDecoration(
                          color: AppColors.redColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.call_end,
                          color: AppColors.whiteColor,
                          size: 32.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextProperty(
                        text: 'Decline',
                        textColor: AppColors.whiteColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                
                // Answer button
                GestureDetector(
                  onTap: () => controller.answerCall(),
                  child: Column(
                    children: [
                      Container(
                        width: 70.w,
                        height: 70.w,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryGreenColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.call,
                          color: AppColors.whiteColor,
                          size: 32.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextProperty(
                        text: 'Answer',
                        textColor: AppColors.whiteColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}
