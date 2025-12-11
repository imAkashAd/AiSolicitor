import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/features/tab_views/phone_view/controller/custom_tabbar_widget_controller.dart';

class TabItem {
  final String label;
  final String? iconPath;

  TabItem({required this.label, this.iconPath});
}

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomTabBarWidgetController());

    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.fadeBlackColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                controller.selectedTabs.length,
                (index) {
                  final isSelected =
                      controller.selectedTabIndex.value == index;

                  return Row(
                    children: [
                      SizedBox(
                        width: 96.w,
                        child: GestureDetector(
                          onTap: () => controller.selectTab(index),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.blueText
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: TextProperty(
                                text: controller.selectedTabs[index],
                                fontSize: 13.sp,
                                textColor: isSelected
                                    ? AppColors.whiteColor
                                    : AppColors.whiteColor,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (index != controller.selectedTabs.length - 1)
                      Padding(padding: EdgeInsets.only(right: 8.w),),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
