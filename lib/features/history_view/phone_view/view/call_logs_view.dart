import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ryanlord/core/common/widgets/custom_search_bar.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';

class CallLogsView extends StatelessWidget {
  const CallLogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(IconPath.phone, width: 24.w, height: 24.h, color: AppColors.blueText,),
                    SizedBox(width: 8.w),
                    TextProperty(
                      text: 'Call Logs',
                      textColor: AppColors.whiteColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h,),
              Align(
                alignment: Alignment.center,
                child: TextProperty(
                  text: 'Recent call history and security status',
                  textColor: AppColors.whiteColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8.h,),
              CustomSearchBar(
                showBorder: false,
                hintText: 'Search by contact or name')
            ],
          ),
        ),
      ),
    );
  }
}
