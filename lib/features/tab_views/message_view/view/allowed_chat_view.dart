import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/common/widgets/custom_textfield.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/features/tab_views/message_view/controller/allowed_chat_controller.dart';

class AllowedChatView extends StatelessWidget {
  final String? name;
  final String? avatar;
  final String? number;

  const AllowedChatView({super.key, this.name, this.avatar, this.number});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllowedChatController());

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
            CircleAvatar(
              radius: 20.w,
              backgroundImage: avatar != null ? AssetImage(avatar!) : null,
            ),
            SizedBox(width: 12.w),
            TextProperty(
              text: name ?? 'Mon Shelly',
              textColor: AppColors.whiteColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.w),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.primaryGreenColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.check_circle, size: 16.w, color: AppColors.primaryGreenColor),
                SizedBox(width: 4.w),
                TextProperty(
                  text: 'Allow',
                  textColor: AppColors.primaryGreenColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: AppColors.whiteColor),
            onPressed: () {},
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
                  final isSent = message['isSent'] as bool;
                  
                  return Column(
                    children: [
                      if (index == 0)
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: TextProperty(
                            text: 'Today',
                            textColor: AppColors.greyColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      Align(
                        alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12.h),
                          padding: EdgeInsets.all(12.w),
                          constraints: BoxConstraints(maxWidth: 280.w),
                          decoration: BoxDecoration(
                            color: isSent
                                ? AppColors.blueText
                                : AppColors.lightWhiteColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextProperty(
                                text: message['text'],
                                textColor: AppColors.whiteColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(height: 4.h),
                              TextProperty(
                                text: message['time'],
                                textColor: AppColors.greyColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
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
                GestureDetector(
                  onTap: () => controller.sendMessage(controller.messageController.text),
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColors.blueText,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.send, color: AppColors.whiteColor, size: 20.w),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}