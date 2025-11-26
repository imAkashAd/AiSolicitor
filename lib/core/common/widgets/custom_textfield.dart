import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';

class CustomTextfield extends StatelessWidget {
  final Color? fillColor;
  final String fieldText;
  final Color? enColor;
  final Color? foColor;
  final bool isPassword;
  final String? prefixIcon; // asset path to image
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextfield({
    super.key,
    this.fillColor,
    required this.fieldText,
    this.enColor,
    this.foColor,
    this.isPassword = false,
    this.prefixIcon,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final RxBool isObscure = isPassword.obs;

    return Obx(() {
      return Container(
        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10.6,
          offset: Offset(0, 0),
        ),
      ],
    ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          obscureText: isObscure.value,
          cursorColor: AppColors.whiteColor,
          cursorHeight: 20.h,
          keyboardType: keyboardType ?? TextInputType.text,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteColor,
          ),
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: Image.asset(
                      prefixIcon!,
                      height: 16.h,
                      width: 16.w,
                      fit: BoxFit.contain,
                    ),
                  )
                : null,
        
            prefixIconConstraints: BoxConstraints(
              minWidth: 0,
              minHeight: 0,
              maxHeight: 24.h,
            ),
            suffixIconConstraints: BoxConstraints(
              minWidth: 0,
              minHeight: 0,
              maxHeight: 24.h,
            ),
        
            suffixIcon: isPassword
                ? Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 12.w),
                    child: GestureDetector(
                      onTap: () => isObscure.value = !isObscure.value,
                      child: Icon(
                        isObscure.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 16.h,
                        color: const Color(0xFFC4CDD5),
                      ),
                    ),
                  )
                : null,
        
            isDense: true,
            filled: true,
            fillColor: fillColor ?? AppColors.secondaryBackgroundColor,
            contentPadding: EdgeInsets.symmetric(
              vertical: 14.h,
              horizontal: 13.w,
            ),
            border: InputBorder.none,
            hintText: fieldText,
            hintStyle: TextStyle(
              fontFamily: 'Satoshi',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.hintTextColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: enColor ?? Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: foColor ?? Colors.transparent),
            ),
          ),
        ),
      );
    });
  }
}
