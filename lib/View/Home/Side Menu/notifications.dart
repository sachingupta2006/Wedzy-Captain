import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';

import '../../../Routes/route_name.dart';
import '../../../Utils/Common/common_date_popup.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBarDynamic(
            titleTxt: 'Notifications',
            preferredSize: const Size.fromHeight(90),
            search: true,
            useCustomWidget: true,
            customWidget: Stack(
              children: [
                TabBar(
                    indicatorColor: AppColors.buttoncolour,
                    indicatorWeight: 2.h,
                    labelPadding: EdgeInsets.only(bottom: 12.h),
                    tabs: [
                      text373434_15w400('Alerts'),
                      text373434_15w400('Reminders'),
                      text373434_15w400('Updates'),
                    ]),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: -8.h,
                    child: const Divider(
                      thickness: 0.25,
                      color: AppColors.buttoncolour,
                    ))
              ],
            ),
            suffixWidget: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    presentDatePicker(context);
                  },
                  child: const Icon(
                    Icons.calendar_today,
                    color: AppColors.buttoncolour,
                  ),
                ),
                sizedBoxWidth(16.w)
              ],
            )),
        body: TabBarView(children: [tab1(), tab1(), tab1()]),
      ),
    );
  }

  Widget tab1() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customTile(),
          customTile(divider: false),
          text373434_15w400('Yesterday'),
          sizedBoxHeight(16.h),
          customTile()
        ],
      ),
    );
  }

  Widget customTile({bool? divider}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(RouteName.chatbox);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      radius: 24.r, child: Image.asset('assets/images/dp.png')),
                  sizedBoxWidth(25.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBoxHeight(5.h),
                      text373434_15w700('Virat & Anushka'),
                      text9B9B9B_15w400('Lorem ipsum dolor sit......')
                    ],
                  ),
                ],
              ),
              text9B9B9B_12w400('1 day ago')
            ],
          ),
        ),
        divider == false
            ? sizedBoxHeight(18.h)
            : Divider(
                color: const Color(0x66F05E90),
                thickness: 0.25.h,
                height: 36.h),
      ],
    );
  }
}
