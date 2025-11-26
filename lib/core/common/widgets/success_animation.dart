import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ryanlord/core/common/controllers/success_animation_controller.dart';
import 'package:ryanlord/core/utils/constants/animated_icon_path.dart';

class SuccessAnimation extends StatelessWidget {
  const SuccessAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    final SuccessAnimationController lottieCtrl = Get.put(
      SuccessAnimationController(),
    );

    return Lottie.asset(
      AnimatedIconPath.checked,
      controller: lottieCtrl.animationController,
      onLoaded: (composition) {
        lottieCtrl.animationController.duration = composition.duration;
        lottieCtrl.playAndHold();
      },
      width: 60.w,
      height: 60.h,
      repeat: false,
    );
  }
}
