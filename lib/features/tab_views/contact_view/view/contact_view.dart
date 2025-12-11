import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/features/tab_views/contact_view/widget/contact_list.dart';
import 'package:ryanlord/features/tab_views/phone_view/controller/custom_tabbar_widget_controller.dart';
import 'package:ryanlord/core/common/widgets/custom_search_bar.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/features/tab_views/phone_view/widget/custom_tabbar_widget.dart';
import 'package:ryanlord/features/tab_views/phone_view/widget/custom_tabbar_widget_view.dart';
import 'package:ryanlord/features/tab_views/profile_view/view/profile_view.dart';

class ContactView extends StatelessWidget {
  final CustomTabBarWidgetController tabController = Get.put(
    CustomTabBarWidgetController(),
  );

  ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      IconPath.phone,
                      width: 24.w,
                      height: 24.h,
                      color: AppColors.blueText,
                    ),
                    SizedBox(width: 8.w),
                    TextProperty(
                      text: 'Contacts',
                      textColor: AppColors.whiteColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  icon: Image.asset(IconPath.threeDot, width: 16.w, height: 16.h, color: AppColors.whiteColor),
                  color: AppColors.secondaryBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  offset: Offset(0, 50.h),
                  onSelected: (value) {
                    if (value == 'profile') {
                      Get.to(() => ProfileView());
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'profile',
                      child: Row(
                        children: [
                          Icon(Icons.person, color: AppColors.primaryGreenColor, size: 20.w),
                          SizedBox(width: 12.w),
                          TextProperty(
                            text: 'Profile',
                            textColor: AppColors.whiteColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            SizedBox(height: 12.h),
            CustomSearchBar(
              showBorder: false,
              hintText: 'Search by contact or name',
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: SingleChildScrollView(child: ContactList()),
            ),
          ],
        ),
      ),
    );
  }
}
