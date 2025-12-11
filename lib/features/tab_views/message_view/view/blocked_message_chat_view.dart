import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/common/widgets/custom_textfield.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/features/tab_views/message_view/controller/blocked_message_chat_controller.dart';

class BlockedMessageChatView extends StatelessWidget {
  final String? number;
  final String? avatar;

  const BlockedMessageChatView({super.key, this.number, this.avatar});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BlockedMessageChatController());

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
            Icon(Icons.block, color: AppColors.redColor, size: 24.w),
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
              color: AppColors.redColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.block, size: 16.w, color: AppColors.redColor),
                SizedBox(width: 4.w),
                TextProperty(
                  text: 'Blocked',
                  textColor: AppColors.redColor,
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
            child: Obx(
              () => ListView.builder(
                padding: EdgeInsets.all(20.w),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  
                  return Column(
                    children: [
                      if (index == 0)
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: TextProperty(
                            text: message['time'],
                            textColor: AppColors.greyColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12.h),
                          padding: EdgeInsets.all(16.w),
                          constraints: BoxConstraints(maxWidth: 280.w),
                          decoration: BoxDecoration(
                            color: AppColors.lightWhiteColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextProperty(
                            text: message['text'],
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
                            onPressed: () => controller.reportUser(),
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
                            onPressed: null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.redColor,
                              disabledBackgroundColor: AppColors.redColor.withOpacity(0.6),
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
                  );
                },
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
                    controller: controller.messageController,
                    fieldText: 'Type message here',
                  ),
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
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
