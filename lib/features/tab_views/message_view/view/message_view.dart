import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/features/tab_views/message_view/controller/message_custom_tabbar_widget_controller.dart';
import 'package:ryanlord/core/common/widgets/custom_search_bar.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/features/tab_views/message_view/widget/message_custom_tabbar_widget.dart';
import 'package:ryanlord/features/tab_views/message_view/widget/message_custom_tabbar_widget_view.dart';
import 'package:ryanlord/features/tab_views/phone_view/widget/custom_tabbar_widget.dart';
import 'package:ryanlord/features/tab_views/phone_view/widget/custom_tabbar_widget_view.dart';

class MessageView extends StatelessWidget {
  final MessageCustomTabbarWidgetController tabController = Get.put(
    MessageCustomTabbarWidgetController(),
  );

  MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    IconPath.message,
                    width: 24.w,
                    height: 24.h,
                    color: AppColors.blueText,
                  ),
                  SizedBox(width: 8.w),
                  TextProperty(
                    text: 'Messages',
                    textColor: AppColors.whiteColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Align(
              alignment: Alignment.center,
              child: TextProperty(
                text: 'Recent call history and security status',
                textColor: AppColors.whiteColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20.h),
            CustomSearchBar(
              showBorder: false,
              hintText: 'Search by contact or name',
            ),
            SizedBox(height: 15.h),
            Center(child: MessageCustomTabbarWidget()),
            SizedBox(height: 20.h),
            Expanded(
              child: SingleChildScrollView(child: MessageCustomTabbarWidgetView()),
            ),
          ],
        ),
      ),
    );
  }
}
