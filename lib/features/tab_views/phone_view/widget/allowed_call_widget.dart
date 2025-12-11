import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';

class AllowedCallWidget extends StatelessWidget {

  final String? name;
  final String? number;
  final String? time;
  final String? duration;
  final String? avatar;
  final VoidCallback? onTap;


  const AllowedCallWidget({super.key, this.name, this.number, this.time, this.duration, this.avatar, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.fadeBlackColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Image.asset(IconPath.allow, width: 40.w),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextProperty(
                        text: name ?? 'Alexo Sarah',
                        textColor: AppColors.whiteColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      Image.asset(IconPath.allowStatus, height: 20.h),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  TextProperty(
                    text: number ?? '(+1) 987 654 3210',
                    textColor: AppColors.greyColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(IconPath.clock, height: 12.h),
                          SizedBox(width: 8.w),
                          TextProperty(
                            text: time ?? 'Today, 9:45 AM',
                            textColor: AppColors.greyColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(width: 20.w),
                      Row(
                        children: [
                          Image.asset(IconPath.callTime, height: 12.h),
                          SizedBox(width: 8.w),
                          TextProperty(
                            text: duration ?? '9.45',
                            textColor: AppColors.greyColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
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
