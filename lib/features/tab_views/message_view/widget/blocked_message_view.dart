import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ryanlord/core/utils/constants/colors.dart';
import 'package:ryanlord/features/tab_views/message_view/view/blocked_message_chat_view.dart';
import 'package:ryanlord/features/tab_views/message_view/widget/message_list_item.dart';

class BlockedMessageView extends StatelessWidget {
  const BlockedMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MessageListItem(
          avatar: null,
          name: '+1 234-748-9400',
          message: 'You have own 2m Dollars!',
          time: '1h Ago',
          status: 'Blocked',
          statusColor: AppColors.redColor,
          statusIcon: Icons.block,
          hasUnread: true,
          onTap: () => Get.to(() => BlockedMessageChatView(number: '+1 234-748-9400')),
        ),
        MessageListItem(
          avatar: null,
          name: '+1 234-748-9400',
          message: 'You have own 2m Dollars!',
          time: '1h Ago',
          status: 'Blocked',
          statusColor: AppColors.redColor,
          statusIcon: Icons.block,
          hasUnread: true,
          onTap: () => Get.to(() => BlockedMessageChatView(number: '+1 234-748-9400')),
        ),
        MessageListItem(
          avatar: null,
          name: '+1 234-748-9400',
          message: 'You have own 2m Dollars!',
          time: '1h Ago',
          status: 'Blocked',
          statusColor: AppColors.redColor,
          statusIcon: Icons.block,
          hasUnread: true,
          onTap: () => Get.to(() => BlockedMessageChatView(number: '+1 234-748-9400')),
        ),
      ],
    );
  }
}