import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final Color? imageColor;
  final BorderRadius? borderRadius;
  final Color? iconColor;
  final IconData? icon;
  final Color? borderColor;
  final String text;
  final String? iconImagePath;
  final Color? color;
  final Color? textColor;
  final VoidCallback onTap;
  final double? fontSize;
  final double? width;
  final double? height;
  final double? iconSize;
  final double? buttonHeight;
  final double? buttonWidth;
  final String? suffImagePath;
  final String? fontFamily;
  final bool? isBorderColorNeed;

  const CustomButton({
    this.imageColor,
    this.borderRadius,
    this.iconColor,
    super.key,
    required this.text,
    required this.onTap,
    this.iconImagePath,
    this.color,
    this.textColor,
    this.fontSize,
    this.borderColor,
    this.icon,
    this.width,
    this.height,
    this.iconSize,
    this.buttonHeight,
    this.buttonWidth,
    this.suffImagePath,
    this.fontFamily,
    this.isBorderColorNeed = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        // height: 40.h,
        padding: EdgeInsets.only(
          top: 10.h,
          bottom: 10.h,
          left: 28.w,
          right: 28.w,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: 1.w,
          ), 
          // boxShadow: isBorderColorNeed == true ? [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.15),
          //     blurRadius: 4.r,
          //     offset: Offset(0, 4),
          //   )
            
          // ] : [],
          borderRadius: borderRadius ?? BorderRadius.circular(11.r),
          color: color ?? AppColors.blueText ,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconImagePath != null)
              Image.asset(
                iconImagePath!,
                height: height,
                width: width,
                color: imageColor,
              ),
            if (iconImagePath != null) SizedBox(width: 8.h),

            // ignore: unnecessary_null_comparison
            if (text != null)
              Text(
                text,
                style: TextStyle(
                  fontFamily: fontFamily ?? 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize ?? 14.sp,
                  color: textColor ?? Colors.white,
                ),
              ),
            if (suffImagePath != null)
              Row(
                children: [
                  SizedBox(width: 8.w),
                  Image.asset(suffImagePath!, width: iconSize, height: iconSize),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
