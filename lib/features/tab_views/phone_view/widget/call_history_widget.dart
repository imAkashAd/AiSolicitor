import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ryanlord/core/common/widgets/text_property.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';

class CallHistoryWidget extends StatelessWidget {

  final String? time;
  final String? duration;

  const CallHistoryWidget({super.key, this.time, this.duration});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(IconPath.callhis, width: 24),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextProperty(text: time ?? '10:20 AM', textColor: AppColors.whiteColor, fontSize: 16.sp, fontWeight: FontWeight.w600),
            TextProperty(text: duration ?? 'Incoming Call- 5 min 26 sec', textColor: AppColors.whiteColor, fontSize: 14.sp, fontWeight: FontWeight.w400),
          ],
        )
      ],
    );
  }
}