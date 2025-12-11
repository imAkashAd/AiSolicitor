import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ryanlord/core/common/widgets/custom_app_bar.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/features/tab_views/phone_view/widget/call_history_widget.dart';

class UnknownContactDetailsView extends StatelessWidget {
  final String? name;
  final String? number;
  final String? avatar;
  
  const UnknownContactDetailsView({super.key, this.name, this.number, this.avatar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: CustomAppBar(
        title: '',
        homePage: false,
        callStatus: IconPath.spamStatus,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60.w,
                      child: Image.asset(avatar ?? IconPath.avatar, width: 300.w),
                    ),
                    SizedBox(height: 20.h),
                    TextProperty(
                      text: name ?? 'Unknown',
                      textColor: AppColors.yellowColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8.h),
                    TextProperty(
                      text: number ?? '(+1) 123 456 7890',
                      textColor: AppColors.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(IconPath.callNow, width: 42.w),
                        SizedBox(width: 20.w),
                        Image.asset(IconPath.messageNow, width: 42.w),
                      ],
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 40.h)),
              TextProperty(
                text: 'Today',
                textColor: AppColors.blueText,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 20.h),
              CallHistoryWidget(time: '10:20 AM', duration: 'Incoming Call- 5 min 26 sec'),
              SizedBox(height: 12.h),
              CallHistoryWidget(time: '09:30 AM', duration: 'Incoming Call- 6 min 10 sec'),
              Padding(padding: EdgeInsets.only(top: 30.h)),
              TextProperty(
                text: 'Yesterday',
                textColor: AppColors.blueText,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 20.h),
              CallHistoryWidget(time: '23:30 PM', duration: 'Incoming Call- 10 min 26 sec'),
              SizedBox(height: 12.h),
              CallHistoryWidget(time: '21:16 PM', duration: 'Outgoing Call- 0 min 46 sec'),
              SizedBox(height: 12.h),
              CallHistoryWidget(time: '17:32 PM', duration: 'Incoming Call- 22 min 10 sec'),
              SizedBox(height: 12.h),
              CallHistoryWidget(time: '16:28 PM', duration: 'Outgoing Call- 5 min 04 sec'),
            ],
          ),
        ),
      ),
    );
  }
}
