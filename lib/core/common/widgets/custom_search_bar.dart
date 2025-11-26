import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';

class CustomSearchBar extends StatelessWidget {
  final double? boxtHeight;
  final double? fontSize;
  final Color? fillColor;
  final double? iconHeight;
  final String hintText;
  final Color? iconColor;
  final String? prefixIcon;
  final bool showBorder;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final List<String>? suggestions;
  final Function(String)? onSuggestionTap;
  final bool showSuggestions;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    this.boxtHeight,
    this.fillColor,
    this.prefixIcon,
    this.iconColor,
    this.fontSize,
    this.iconHeight,
    this.showBorder = true,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.suggestions,
    this.onSuggestionTap,
    this.showSuggestions = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: boxtHeight ?? 40.h,
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            style: TextStyle(
              fontFamily: 'Satoshi',
              color: const Color(0xFF0A0A0A),
              fontSize: fontSize ?? 14.sp,
            ),
            cursorColor: Colors.black,
            cursorHeight: 18,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: fillColor ?? Colors.white,
              hintStyle: TextStyle(
                fontFamily: 'Satoshi',
                color: const Color(0xFF919EAB),
                fontSize: fontSize ?? 14.sp,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: Image.asset(
                        prefixIcon!,
                        color: iconColor,
                        height: iconHeight ?? 16.h,
                      ),
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: showBorder
                    ? const BorderSide(color: AppColors.whiteColor)
                    : BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.r),
                borderSide: showBorder
                    ? const BorderSide(color: AppColors.whiteColor)
                    : BorderSide.none,
              ),
            ),
          ),
        ),
        if (showSuggestions && suggestions != null && suggestions!.isNotEmpty)
          Container(
            margin: EdgeInsets.only(top: 8.h),
            decoration: BoxDecoration(
              color: fillColor ?? Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.whiteColor),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8.r,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            constraints: BoxConstraints(maxHeight: 200.h),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: suggestions!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => onSuggestionTap?.call(suggestions![index]),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      border: index != suggestions!.length - 1
                          ? Border(bottom: BorderSide(color: AppColors.whiteColor.withOpacity(0.3)))
                          : null,
                    ),
                    child: Text(
                      suggestions![index],
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: fontSize ?? 14.sp,
                        color: const Color(0xFF0A0A0A),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
