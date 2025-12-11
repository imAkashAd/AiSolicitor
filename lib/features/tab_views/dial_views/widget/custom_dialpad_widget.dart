import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/features/tab_views/dial_views/controller/custom_dialpad_widget_controller.dart';

class CustomDialpadWidget extends StatelessWidget {
  CustomDialpadWidget({super.key});

  final CustomDialpadWidgetController c = Get.put(CustomDialpadWidgetController());

  Widget _buildDialButton(String digit, {String? sub}) {
    return GestureDetector(
      onTap: () => c.addDigit(digit),
      child: Container(
        width: 50.w,
        height: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.lightWhiteColor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextProperty(
                text: digit,
                  textColor: AppColors.whiteColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
              ),
              if (sub != null)
                Padding(
                  padding: EdgeInsets.only(top: 0.h),
                  child: TextProperty(
                   text:  sub,
                      textColor: AppColors.whiteColor,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 2, child: SizedBox()),
        Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Obx(() => Text(
                  c.phoneNumber.value.isEmpty ? '' : c.phoneNumber.value,
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
              ),
              // Delete button on right
              Positioned(
                right: 0,
                child: Obx(() => c.phoneNumber.isNotEmpty
                  ? GestureDetector(
                      onTap: () => c.deleteDigit(),
                      child: Container(
                        padding: EdgeInsets.all(6.w),
                        child: Icon(
                          Icons.backspace_outlined,
                          color: Colors.white.withOpacity(0.7),
                          size: 22.sp,
                        ),
                      ),
                    )
                  : SizedBox(width: 40.w)),
              ),
            ],
          ),
        ),

        SizedBox(height: 20.h),

        // Dialpad grid
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDialButton("1"),
                  _buildDialButton("2", sub: "ABC"),
                  _buildDialButton("3", sub: "DEF"),
                ],
              ),
              SizedBox(height: 14.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDialButton("4", sub: "GHI"),
                  _buildDialButton("5", sub: "JKL"),
                  _buildDialButton("6", sub: "MNO"),
                ],
              ),
              SizedBox(height: 14.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDialButton("7", sub: "PQRS"),
                  _buildDialButton("8", sub: "TUV"),
                  _buildDialButton("9", sub: "WXYZ"),
                ],
              ),
              SizedBox(height: 14.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDialButton("*"),
                  _buildDialButton("0", sub: "+"),
                  _buildDialButton("#"),
                ],
              ),
              SizedBox(height: 14.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => c.makeCall(),
                    child: Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        color: AppColors.trioryGreenColor,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Image.asset(
                          IconPath.phone,
                          width: 24.w,
                          height: 24.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 30.h), // Space for bottom nav
      ],
    );
  }
}
