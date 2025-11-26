import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? dividerHeight;
  final Color? backgroundColor;
  final Color? dividerColor;
  final String title;
  final  bool? homePage;

  const CustomAppBar({
    super.key,
    this.backgroundColor,
    this.dividerColor,
    required this.title,
    this.dividerHeight,
    this.homePage,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h, bottom: 16.h),
      decoration: BoxDecoration(color: backgroundColor ?? AppColors.primaryBackgroundColor ),
      child: Row(
        children: [
          if (homePage == false)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              // child: Image.asset(IconPath.backButton, width: 30.w, height: 24.h, color: AppColors.whiteColor,),
            ),
            SizedBox(width: 16.w,),
          
          // Expanded(
          //   child: Center(
          //     child: 
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor
                ),
              ),
          //   ),
          // ),

          if (homePage == true)
            GestureDetector(
              onTap: () {},
              child: Icon(Icons.settings, color: AppColors.whiteColor,),
            ),
        ],
      )
    );
  }
}
