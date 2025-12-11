import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/common/widgets/custom_textfield.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/features/tab_views/message_view/controller/blocked_chat_controller.dart';

class BlockedChatView extends StatelessWidget {
  final String? name;
  final String? avatar;
  final String? number;

  const BlockedChatView({super.key, this.name, this.avatar, this.number});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BlockedChatController());

    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () => Get.back(),
        ),
        title: Row(
          children: [
            Icon(Icons.warning, color: AppColors.yellowColor, size: 24.w),
            SizedBox(width: 12.w),
            TextProperty(
              text: number ?? '+1 234-748-9400',
              textColor: AppColors.whiteColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.w),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.yellowColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.warning, size: 16.w, color: AppColors.yellowColor),
                SizedBox(width: 4.w),
                TextProperty(
                  text: 'Spam',
                  textColor: AppColors.yellowColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  TextProperty(
                    text: 'Today',
                    textColor: AppColors.greyColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      constraints: BoxConstraints(maxWidth: 280.w),
                      decoration: BoxDecoration(
                        color: AppColors.lightWhiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextProperty(
                        text: 'You have won 2 Millons Dollars, Go to this link to claim it : www.bit83.com',
                        textColor: AppColors.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColors.whiteColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                        ),
                        child: TextProperty(
                          text: 'Report',
                          textColor: AppColors.whiteColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      ElevatedButton(
                        onPressed: () => controller.showBlockDialog(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.redColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.block, size: 16.w, color: AppColors.whiteColor),
                            SizedBox(width: 4.w),
                            TextProperty(
                              text: 'Blocked',
                              textColor: AppColors.whiteColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.primaryBackgroundColor,
              border: Border(
                top: BorderSide(color: AppColors.greyColor.withOpacity(0.2)),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextfield(
                    
                    controller: controller.messageController, fieldText: 'Type message here',
                    // hintText: 'Type message here...',
                  ),
                  
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                  //   decoration: BoxDecoration(
                  //     color: AppColors.lightWhiteColor,
                  //     borderRadius: BorderRadius.circular(25),
                  //   ),
                  //   child: TextField(
                  //     controller: controller.messageController,
                  //     style: TextStyle(color: AppColors.whiteColor),
                  //     decoration: InputDecoration(
                  //       hintText: 'Type message here...',
                  //       hintStyle: TextStyle(
                  //         color: AppColors.greyColor,
                  //         fontSize: 14.sp,
                  //       ),
                  //       border: InputBorder.none,
                  //     ),
                  //   ),
                  // ),
                ),
                SizedBox(width: 12.w),
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: AppColors.blueText,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.send, color: AppColors.whiteColor, size: 20.w),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}