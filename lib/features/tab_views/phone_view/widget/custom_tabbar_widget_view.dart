import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ryanlord/features/tab_views/phone_view/controller/custom_tabbar_widget_controller.dart';
import 'package:ryanlord/features/tab_views/phone_view/widget/all_tab_view.dart';
import 'package:ryanlord/features/tab_views/phone_view/widget/allowed_tab_view.dart';
import 'package:ryanlord/features/tab_views/phone_view/widget/blocked_tab_view.dart';

class CustomTabbarWidgetView extends StatelessWidget {
  const CustomTabbarWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CustomTabBarWidgetController>();

    final List<Widget> tabViews = [
      AllTabView(),
      AllowedTabView(),
      BlockedTabView(),  

      // const OverviewTab(),
      // GroupMessageTab(),
      // const NotesTab(),
    ];

    return Obx(() {
      return tabViews[controller.selectedTabIndex.value];
    });
  }
}