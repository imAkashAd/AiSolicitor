import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';

class TabItem {
  final String label;
  final String? iconPath;

  TabItem({required this.label, this.iconPath});
}

class CustomTabBarWidget extends StatelessWidget {
  final List<TabItem> tabs;
  final int selectedIndex;
  final Function(int) onTabSelected;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final Color? selectedBackgroundColor;
  final Color? unselectedBackgroundColor;
  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;
  final Color? selectedIconColor;
  final Color? unselectedIconColor;
  final double? borderRadius;
  final MainAxisAlignment? space;
  final double? verPadding;
  final double? horPadding;
  final FlexFit? fit;

  const CustomTabBarWidget({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.selectedBackgroundColor,
    this.unselectedBackgroundColor,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.selectedIconColor,
    this.unselectedIconColor,
    this.borderRadius,
    this.space,
    this.verPadding,
    this.horPadding,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: space ?? MainAxisAlignment.spaceBetween,
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedIndex == index;

          return Flexible(
            fit: fit ?? FlexFit.tight,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              child: GestureDetector(
                onTap: () => onTabSelected(index),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: verPadding ?? 8.h,
                    horizontal: horPadding ?? 12.w,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        blurRadius: 12.r,
                        offset: Offset(0, 8),
                      ),
                    ],
                    color: isSelected
                        ? (selectedBackgroundColor ?? AppColors.whiteColor)
                        : (unselectedBackgroundColor ?? AppColors.whiteColor),
                    borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
                    border: isSelected
                        ? Border.all(
                            color:
                                selectedBorderColor ??
                                AppColors.whiteColor,
                          )
                        : Border.all(color: Colors.transparent),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (tabs[index].iconPath != null)
                        Image.asset(
                          tabs[index].iconPath!,
                          width: 24.w,
                          height: 24.h,
                          color: isSelected
                              ? (selectedIconColor ??
                                    AppColors.whiteColor)
                              : (unselectedIconColor ??
                                    AppColors.whiteColor),
                        ),
                      TextProperty(
                        text: tabs[index].label,
                        textColor: isSelected
                            ? (selectedTextColor ??
                                  AppColors.whiteColor)
                            : (unselectedTextColor ??
                                  AppColors.whiteColor),
                        fontSize: 12.sp,
                        fontWeight: isSelected
                            ? FontWeight.w400
                            : FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
