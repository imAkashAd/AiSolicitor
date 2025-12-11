import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/features/tab_views/phone_view/view/blocked_contact_details_view.dart';
import 'package:ryanlord/features/tab_views/phone_view/widget/allowed_call_widget.dart';
import 'package:ryanlord/features/tab_views/phone_view/widget/blocked_call_widget.dart';

class BlockedTabView extends StatelessWidget {
  const BlockedTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlockedCallWidget(
          avatar: IconPath.maleAvatar,
          onTap: () {
            Get.to(() => BlockedContactDetailsView(name: 'Unknown', number: '(+1) 987 654 3233', avatar: IconPath.maleAvatar));
          },
        ),
        SizedBox(height: 10.h),
        BlockedCallWidget(
          number: '(+1) 123-456-7890',
          avatar: IconPath.femaleAvatar,
          onTap: () {
            Get.to(() => BlockedContactDetailsView(name: 'Unknown', number: '(+1) 123-456-7890', avatar: IconPath.femaleAvatar));
          },
        ),
        SizedBox(height: 10.h),
        BlockedCallWidget(
          number: '(+1) 321-456-5646',
          avatar: IconPath.maleAvatar,
          onTap: () {
            Get.to(() => BlockedContactDetailsView(name: 'Unknown', number: '(+1) 321-456-5646', avatar: IconPath.maleAvatar));
          },
        ),
        SizedBox(height: 10.h),
        BlockedCallWidget(
          number: '(+1) 231-541-5690',
          avatar: IconPath.femaleAvatar,
          onTap: () {
            Get.to(() => BlockedContactDetailsView(name: 'Unknown', number: '(+1) 231-541-5690', avatar: IconPath.femaleAvatar));
          },
        ),
        SizedBox(height: 10.h),
        BlockedCallWidget(
          number: '(+1) 987-654-3210',
          avatar: IconPath.maleAvatar,
          onTap: () {
            Get.to(() => BlockedContactDetailsView(name: 'Unknown', number: '(+1) 987-654-3210', avatar: IconPath.maleAvatar));
          },
        ),
      ],
    );
  }
}
