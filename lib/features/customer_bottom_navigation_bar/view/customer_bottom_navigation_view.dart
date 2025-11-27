// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/features/customer_bottom_navigation_bar/controller/bottom_navigation_bar_controller.dart';
import 'package:ryanlord/features/history_view/dial_views/view/dialpad_view.dart';
import 'package:ryanlord/features/history_view/phone_view/view/call_logs_view.dart';


class CustomerBottomNavigationView extends StatelessWidget {
  final CustomerBottomNavigationBarController controller = Get.put(
    CustomerBottomNavigationBarController(),
  );

  final List<Widget> pages = [
    DialpadView(),
    CallLogsView(),
    Center(child: Text('Message Screen')),
    Center(child: Text('Contact Screen')),
  ];
  CustomerBottomNavigationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => Container(
          padding: EdgeInsets.only(top: 0.h, bottom: 30.h),
          decoration: BoxDecoration(
            color: AppColors.bottomNavBackColor,
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(30.r), 
            //   topRight: Radius.circular(30.r),
            // ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.22),
                blurRadius: 100,
                offset: Offset(0, -15),
                spreadRadius: 0
              ),
            ],
          ),
          child: Row(
            children: List.generate(4, (index) {
              final List<String> icons = [
                IconPath.dial,
                IconPath.phone,
                IconPath.message,
                IconPath.contact,
              ];
              final List<String> labels = [
                'Home',
                'Phone',
                'Message',
                'Profile',
              ];

              return Expanded(
                child: GestureDetector(
                  onTap: () => controller.changeTabIndex(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                  //     Container(
                  //       width: 30.w,
                  //       height: 7.h,
                  //       decoration: BoxDecoration(
                  //   color: controller.selectedIndex.value == index
                  //       ? AppColors.blueText
                  //       : Colors.transparent,
                  //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r), bottomRight: Radius.circular(10.r)),
                  // ),
                  //     ),
                      SizedBox(height: 8.h,),
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          controller.selectedIndex.value == index
                              ? AppColors.blueText
                              : AppColors.whiteColor,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          icons[index],
                          width: 24.w,
                          height: 24.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 8.h,),
                      Flexible(
                        child: Text(
                          labels[index],
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 14.sp,
                            fontWeight:
                                controller.selectedIndex.value == index
                                ? FontWeight.w500
                                : FontWeight.w500,
                            color: controller.selectedIndex.value == index
                                ? AppColors.blueText
                                : AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}