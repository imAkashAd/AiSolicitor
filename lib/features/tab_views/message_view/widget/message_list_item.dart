import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';

class MessageListItem extends StatelessWidget {
  final String? avatar;
  final String name;
  final String message;
  final String time;
  final String status;
  final Color statusColor;
  final IconData statusIcon;
  final bool hasUnread;
  final VoidCallback? onTap;

  const MessageListItem({
    super.key,
    this.avatar,
    required this.name,
    required this.message,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.statusIcon,
    this.hasUnread = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 28.w,
                  backgroundImage: avatar != null ? AssetImage(avatar!) : null,
                  child: avatar == null
                      ? Icon(Icons.person, size: 32.w, color: AppColors.greyColor)
                      : null,
                ),
                if (status != '')
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryBackgroundColor,
                          width: 2,
                        ),
                      ),
                      child: Icon(statusIcon, size: 12.w, color: AppColors.whiteColor),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextProperty(
                        text: name,
                        textColor: AppColors.whiteColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      if (hasUnread)
                        Container(
                          width: 20.w,
                          height: 20.w,
                          decoration: BoxDecoration(
                            color: AppColors.blueText,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: TextProperty(
                              text: '2',
                              textColor: AppColors.whiteColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      if (status != '')
                        Row(
                          children: [
                            Icon(statusIcon, size: 14.w, color: statusColor),
                            SizedBox(width: 4.w),
                            TextProperty(
                              text: status,
                              textColor: statusColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(width: 8.w),
                          ],
                        ),
                      Expanded(
                        child: TextProperty(
                          text: message,
                          textColor: AppColors.greyColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 12.w, color: AppColors.greyColor),
                      SizedBox(width: 4.w),
                      TextProperty(
                        text: time,
                        textColor: AppColors.greyColor,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
