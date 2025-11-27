import 'package:flutter/material.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/features/history_view/dial_views/widget/custom_dialpad_widget.dart';

class DialpadView extends StatelessWidget {
  const DialpadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: CustomDialpadWidget(),
      ),
    );
  }
}