import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/features/auth/splash_view/controller/splash_view_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashViewController());
    
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: Center(
        child: Image.asset(IconPath.logo, height: 248.h, width: 213.w,)
      ),
    );
  }
}