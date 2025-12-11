import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/services/call_services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? dividerHeight;
  final Color? backgroundColor;
  final Color? dividerColor;
  final String? title;
  final String? middleTitle;
  final bool? homePage;
  final Color? titleColor;
  final Color? backButtonColor;
  final Color? middleTitleColor;
  final bool showEditButton;
  final VoidCallback? onEditTap;
  final String? rightButtonText;
  final String? rightButtonIcon;
  final String? callStatus;

  const CustomAppBar({
    super.key,
    this.backgroundColor,
    this.dividerColor,
    this.title,
    this.middleTitle,
    this.dividerHeight,
    this.homePage,
    this.titleColor,  
    this.backButtonColor,
    this.middleTitleColor,
    this.showEditButton = false,
    this.onEditTap,
    this.rightButtonText,
    this.rightButtonIcon,
    this.callStatus,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h, bottom: 16.h),
      decoration: BoxDecoration(color: backgroundColor ?? AppColors.primaryBackgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (homePage == false)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                IconPath.arrowBack,
                width: 16.w,
                height: 16.h, 
                color: backButtonColor,
              ),
            ),
          if (title != null) ...[
            SizedBox(width: 16.w),
            Text(
              title!,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: titleColor ?? AppColors.whiteColor,
              ),
            ),
          ],
          if (middleTitle != null)
            Expanded(
              child: Text(
                middleTitle!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: middleTitleColor ?? AppColors.whiteColor,
                ),
              ),
            )
          else
            const Spacer(),
          if (showEditButton || rightButtonText != null)
            GestureDetector(
              onTap: onEditTap,
              child: Row(
                children: [
                  if (rightButtonIcon != null)
                    Image.asset(
                      rightButtonIcon!,
                    ),
                  if (rightButtonIcon != null && rightButtonText != null)
                    SizedBox(width: 4.w),
                  if (rightButtonText != null)
                    Text(
                      rightButtonText!,
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                      ),
                    ),
                ],
              ),
            )
          else if (homePage == false)
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                callStatus!,
              ),
            )
          else
            SizedBox(width: 30.w),
        ],
      ),
    );
  }
}
