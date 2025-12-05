import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/features/call_view/controller/call_controller.dart';

class OngoingCallView extends StatelessWidget {
  const OngoingCallView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CallController>();
    
    return Scaffold(
      backgroundColor: Color(0xFF1A4D5C),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  
                  // Call status or duration with icon
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!controller.isCallActive.value)
                        Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: SizedBox(
                            width: 12.w,
                            height: 12.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      TextProperty(
                        text: controller.isCallActive.value 
                            ? controller.callDuration.value 
                            : 'Calling...',
                        textColor: AppColors.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )),
                  
                  SizedBox(height: 20.h),
                  
                  // Caller name
                  Obx(() => TextProperty(
                    text: controller.callerName.value,
                    textColor: AppColors.whiteColor,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                  )),
                  
                  SizedBox(height: 6.h),
                  
                  // Caller number
                  Obx(() => TextProperty(
                    text: controller.callerNumber.value,
                    textColor: AppColors.whiteColor.withOpacity(0.8),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  )),
                  
                  SizedBox(height: 30.h),
                  
                  // Caller avatar
                  Container(
                    width: 120.w,
                    height: 120.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightWhiteColor.withOpacity(0.3),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 60.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  
                  Spacer(),
                  
                  // Call controls
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildCallControl(
                              icon: Icons.mic_off,
                              label: 'Mute',
                              isActive: controller.isMuted,
                              onTap: () => controller.toggleMute(),
                            ),
                            _buildCallControl(
                              icon: Icons.dialpad,
                              label: 'Keypad',
                              isActive: false.obs,
                              onTap: () {},
                            ),
                            _buildCallControl(
                              icon: Icons.volume_up,
                              label: 'Speaker',
                              isActive: controller.isSpeakerOn,
                              onTap: () => controller.toggleSpeaker(),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildCallControl(
                              icon: Icons.videocam,
                              label: 'Video call',
                              isActive: false.obs,
                              onTap: () {},
                            ),
                            _buildCallControl(
                              icon: Icons.person_add,
                              label: 'Add call',
                              isActive: false.obs,
                              onTap: () {},
                            ),
                            _buildCallControl(
                              icon: Icons.contacts,
                              label: 'Contact',
                              isActive: false.obs,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 40.h),
                  
                  // End call button
                  GestureDetector(
                    onTap: () => controller.endCall(),
                    child: Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        color: AppColors.redColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.call_end_rounded,
                        color: AppColors.whiteColor,
                        size: 28.sp,
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCallControl({
    required IconData icon,
    required String label,
    required RxBool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() => Container(
            width: 45.w,
            height: 45.w,
            decoration: BoxDecoration(
              color: isActive.value 
                ? AppColors.whiteColor.withOpacity(0.3) 
                : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.whiteColor,
              size: 22.sp,
            ),
          )),
          SizedBox(height: 6.h),
          TextProperty(
            text: label,
            textColor: AppColors.whiteColor,
            fontSize: 9.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
