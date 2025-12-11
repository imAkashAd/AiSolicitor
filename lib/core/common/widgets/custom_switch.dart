import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/common/controllers/custom_switch_controller.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  final CustomSwitchController controller = Get.put(CustomSwitchController());

  CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      // scale: 0.85,
      scaleX: 1,
      scaleY: .9,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: AppColors.whiteColor,
        activeTrackColor: AppColors.primaryGreenColor,
        inactiveThumbColor: AppColors.secondaryGreyText,
        inactiveTrackColor: AppColors.primaryGreenColor.withOpacity(0.2),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),

        // Additional styling
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}