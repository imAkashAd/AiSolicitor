import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ryanlord/core/utils/constants/icon_path.dart';
import 'package:ryanlord/features/tab_views/contact_view/widget/contact_widget.dart';
import 'package:ryanlord/features/tab_views/phone_view/view/allowed_contact_details_view.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContactWidget(
          name: 'Sarah',
          number: '(+1) 987 654 3210',  
          onTap: () {
            Get.to(() => AllowedContactDetailsView(name: 'Sarah', number: '(+1) 987 654 3210', avatar: IconPath.avatar));
          },
        ),
        SizedBox(height: 10.h,),
        ContactWidget( 
          name: 'Mom',
          number: '(+1) 987 654 3210',  
          onTap: () {
            Get.to(() => AllowedContactDetailsView(name: 'Mom', number: '(+1) 987 654 3210', avatar: IconPath.femaleAvatar));
          },
        ),
        SizedBox(height: 10.h,),
        ContactWidget(
          name: 'Jennifer',
          number: '(+1) 987 654 3210',
          onTap: () {
            Get.to(() => AllowedContactDetailsView(name: 'Jennifer', number: '(+1) 987 654 3210', avatar: IconPath.avatar));
          },
        ),
        SizedBox(height: 10.h,),
        ContactWidget(
          name: 'Lira Lindle',
          number: '(+1) 987 654 3210',
          onTap: () {
            Get.to(() => AllowedContactDetailsView(name: 'Lira Lindle', number: '(+1) 987 654 3210', avatar: IconPath.femaleAvatar));
          },
        ),
        SizedBox(height: 10.h,),
        ContactWidget(
          name: 'Daddy',
          number: '(+1) 987 654 3210',
          onTap: () {
            Get.to(() => AllowedContactDetailsView(name: 'Daddy', number: '(+1) 987 654 3210', avatar: IconPath.maleAvatar));
          },
        ),
        SizedBox(height: 10.h,),
        ContactWidget(
          name: 'Alex',
          number: '(+1) 987 654 3210',
          onTap: () {
            Get.to(() => AllowedContactDetailsView(name: 'Alex', number: '(+1) 987 654 3210', avatar: IconPath.maleAvatar));
          },
        ),
        SizedBox(height: 10.h,),
        ContactWidget(
          name: 'John',
          number: '(+1) 987 654 3210',
          onTap: () {
            Get.to(() => AllowedContactDetailsView(name: 'John', number: '(+1) 987 654 3210', avatar: IconPath.maleAvatar));
          },
        ),
        SizedBox(height: 10.h,),
      ],
    );
  }
}