import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';

class ProfileButtonWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const ProfileButtonWidget({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.fadeBlackColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(iconPath, width: 24.w, height: 24.h),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextProperty(
                    text: title,
                    textColor: AppColors.whiteColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  TextProperty(
                    text: subtitle,
                    textColor: AppColors.whiteColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.whiteColor,
              size: 16.w,
            ),
          ],
        ),
      ),
    );
  }
}
