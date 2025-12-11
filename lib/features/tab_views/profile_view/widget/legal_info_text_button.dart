import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';

class LegalInfoTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const LegalInfoTextButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Roboto',
          color: AppColors.secondaryGreyText,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.secondaryGreyText,
        ),
        ),
    ); 
  }
}
