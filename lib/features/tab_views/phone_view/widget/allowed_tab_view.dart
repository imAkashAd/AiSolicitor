import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/features/tab_views/phone_view/view/allowed_contact_details_view.dart';
import 'package:ryanlord/features/tab_views/phone_view/widget/allowed_call_widget.dart';

class AllowedTabView extends StatelessWidget {
  const AllowedTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AllowedCallWidget(
          name: 'Sarah',
          avatar: IconPath.avatar,
          onTap: () {
            Get.to(() => AllowedContactDetailsView(name: 'Sarah', number: '(+1) 987 654 3210', avatar: IconPath.avatar));
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
        AllowedCallWidget(
          name: 'Jennifer',
          avatar: IconPath.avatar,
          onTap: () {
            Get.to(() => AllowedContactDetailsView(name: 'Jennifer', number: '(+1) 987 654 3210', avatar: IconPath.avatar));
          },
        ),
        SizedBox(height: 10.h),
        AllowedCallWidget(
          name: 'Lira Lindle',
          avatar: IconPath.femaleAvatar,
          onTap: () {
            Get.to(() => AllowedContactDetailsView(name: 'Lira Lindle', number: '(+1) 987 654 3210', avatar: IconPath.femaleAvatar));
          },
        ),
        SizedBox(height: 10.h),
        AllowedCallWidget(
          name: 'Daddy',
          avatar: IconPath.maleAvatar,
          onTap: () {
            Get.to(() => AllowedContactDetailsView(name: 'Daddy', number: '(+1) 987 654 3210', avatar: IconPath.maleAvatar));
          },
        ),
      ],
    );
  }
}
