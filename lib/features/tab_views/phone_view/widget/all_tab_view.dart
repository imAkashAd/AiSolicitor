import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/features/tab_views/phone_view/view/allowed_contact_details_view.dart';
import 'package:ryanlord/features/tab_views/phone_view/view/blocked_contact_details_view.dart';
import 'package:ryanlord/features/tab_views/phone_view/view/unknown_contact_details_view.dart';
import 'package:ryanlord/features/tab_views/phone_view/widget/allowed_call_widget.dart';
import 'package:ryanlord/features/tab_views/phone_view/widget/blocked_call_widget.dart';
import 'package:ryanlord/features/tab_views/phone_view/widget/spam_call_widget.dart';

class AllTabView extends StatelessWidget {
  const AllTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AllowedCallWidget(
          avatar: IconPath.femaleAvatar,
          onTap: () {
            Get.to(() => AllowedContactDetailsView(name: 'Alexo Sarah', number: '(+1) 987 654 3210', avatar: IconPath.femaleAvatar));
          },
        ),
        SizedBox(height: 10.h),
        AllowedCallWidget( 
          name: 'Mom',
          avatar: IconPath.femaleAvatar,
          onTap: () {
            Get.to(() => AllowedContactDetailsView(name: 'Mom', number: '(+1) 987 654 3210', avatar: IconPath.femaleAvatar));
          },
        ),
        SizedBox(height: 10.h),
        BlockedCallWidget(
          avatar: IconPath.maleAvatar,
          onTap: () {
            Get.to(() => BlockedContactDetailsView(name: 'Unknown', number: '(+1) 987 654 3233', avatar: IconPath.maleAvatar));
          },
        ),
        SizedBox(height: 10.h),
        SpamCallWidget(
          avatar: IconPath.femaleAvatar,
          onTap: () {
            Get.to(() => UnknownContactDetailsView(name: 'Unknown', number: '(+1) 987 654 3244', avatar: IconPath.femaleAvatar));
          },
        ),
        SizedBox(height: 10.h),
        BlockedCallWidget(
          name: 'Ex',
          avatar: IconPath.femaleAvatar,
          onTap: () {
            Get.to(() => BlockedContactDetailsView(name: 'Ex', number: '(+1) 987 654 3233', avatar: IconPath.femaleAvatar));
          },
        ),
        SizedBox(height: 10.h),
        AllowedCallWidget(
          avatar: IconPath.maleAvatar,
          onTap: () {
            Get.to(() => AllowedContactDetailsView(name: 'Alexo Sarah', number: '(+1) 987 654 3210', avatar: IconPath.maleAvatar));
          },
        ),
      ],
    );
  }
}
