import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/features/tab_views/message_view/view/allowed_chat_view.dart';
import 'package:ryanlord/features/tab_views/message_view/widget/message_list_item.dart';

class AllowedMessageView extends StatelessWidget {
  const AllowedMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MessageListItem(
          avatar: IconPath.femaleAvatar,
          name: 'Mom',
          message: 'See you at 12 AM!',
          time: '1h Ago',
          status: 'Allow',
          statusColor: AppColors.primaryGreenColor,
          statusIcon: Icons.check_circle,
          hasUnread: true,
          onTap: () => Get.to(() => AllowedChatView(
            name: 'Mom',
            avatar: IconPath.femaleAvatar,
            number: '(+1) 987 654 3210',
          )),
        ),
        MessageListItem(
          avatar: IconPath.femaleAvatar,
          name: 'Sarah',
          message: 'See you at 12 AM!',
          time: '1h Ago',
          status: 'Allow',
          statusColor: AppColors.primaryGreenColor,
          statusIcon: Icons.check_circle,
          hasUnread: true,
          onTap: () => Get.to(() => AllowedChatView(
            name: 'Sarah',
            avatar: IconPath.femaleAvatar,
            number: '(+1) 987 654 3210',
          )),
        ),
        MessageListItem(
          avatar: IconPath.femaleAvatar,
          name: 'Sarah',
          message: 'See you at 12 AM!',
          time: '1h Ago',
          status: 'Allow',
          statusColor: AppColors.primaryGreenColor,
          statusIcon: Icons.check_circle,
          hasUnread: true,
          onTap: () => Get.to(() => AllowedChatView(
            name: 'Sarah',
            avatar: IconPath.femaleAvatar,
            number: '(+1) 987 654 3210',
          )),
        ),
        MessageListItem(
          avatar: IconPath.femaleAvatar,
          name: 'Sarah',
          message: 'See you at 12 AM!',
          time: '1h Ago',
          status: 'Allow',
          statusColor: AppColors.primaryGreenColor,
          statusIcon: Icons.check_circle,
          hasUnread: true,
          onTap: () => Get.to(() => AllowedChatView(
            name: 'Sarah',
            avatar: IconPath.femaleAvatar,
            number: '(+1) 987 654 3210',
          )),
        ),
        MessageListItem(
          avatar: IconPath.femaleAvatar,
          name: 'Mira Sahaa',
          message: 'See you at 12 AM!',
          time: '1h Ago',
          status: 'Allow',
          statusColor: AppColors.primaryGreenColor,
          statusIcon: Icons.check_circle,
          hasUnread: true,
          onTap: () => Get.to(() => AllowedChatView(
            name: 'Mira Sahaa',
            avatar: IconPath.femaleAvatar,
            number: '(+1) 987 654 3210',
          )),
        ),
      ],
    );
  }
}