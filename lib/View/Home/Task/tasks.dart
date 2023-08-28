import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wedzy_captain/Routes/route_name.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import '../../../Utils/Common/common_date_popup.dart';
import '../../../Utils/Common/sized_box.dart';
import '../../../Utils/Common/texts.dart';
import '../../../Utils/Widgets/common_appbar_dynamic.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: sizedBoxHeight(60.h),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.buttoncolour,
          onPressed: () {
            Get.toNamed(RouteName.addTask);
          },
          child: const Icon(Icons.add, color: AppColors.white),
        ),
        backgroundColor: AppColors.white,
        appBar: CustomAppBarDynamic(
          useCustomWidget: true,
          backArrow: false,
          titleTxt: 'Tasks',
          preferredSize: const Size.fromHeight(90),
          search: true,
          suffixWidget: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    presentDatePicker(context);
                  },
                  child: const Icon(Icons.calendar_today,
                      color: AppColors.buttoncolour)),
              sizedBoxWidth(16.w)
            ],
          ),
          customWidget: Stack(
            children: [
              TabBar(
                  indicatorColor: AppColors.buttoncolour,
                  indicatorWeight: 2.5.h,
                  labelPadding: EdgeInsets.only(bottom: 12.h),
                  tabs: [
                    text373434_15w400('Ongoing'),
                    text373434_15w400('Upcoming'),
                    text373434_15w400('Completed'),
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
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TabBarView(children: [tab1(), tab2(), tab3()])),
      ),
    );
  }

  Widget tab1() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 24.h, bottom: 80.h),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ongoingUpgoingWidget(30, true),
          ongoingUpgoingWidget(30, true),
          ongoingUpgoingWidget(30, true),
          ongoingUpgoingWidget(30, true),
          ongoingUpgoingWidget(30, true),
        ],
      ),
    );
  }

  Widget tab2() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 24.h, bottom: 80.h),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ongoingUpgoingWidget(0, false),
          ongoingUpgoingWidget(0, false),
          ongoingUpgoingWidget(0, false),
          ongoingUpgoingWidget(0, false),
          ongoingUpgoingWidget(0, false),
        ],
      ),
    );
  }

  Widget tab3() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 24.h, bottom: 80.h),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          completedWidget(),
          completedWidget(),
          completedWidget(),
        ],
      ),
    );
  }

  Widget ongoingUpgoingWidget(int percentInt, bool daysLeft) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(
                daysLeft ? RouteName.ongoingTask : RouteName.upcomingTask);
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 3.w, right: 3.w),
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: const Color(0xFFEE3764),
                    spreadRadius: 0,
                    offset: Offset(-3.w, 0)),
                const BoxShadow(
                    color: Color(0x3F5B5B5B),
                    blurRadius: 4,
                    offset: Offset(0, 1))
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/dp.png', width: 32.w),
                            sizedBoxWidth(8.w),
                            text373434_15w400('Virushka1234')
                          ],
                        ),
                        sizedBoxHeight(5.h),
                        textEE3764_18w400('Invitation Ideas'),
                        sizedBoxHeight(5.h),
                      ],
                    ),
                    CircularPercentIndicator(
                      lineWidth: 4.h,
                      radius: 24.h,
                      circularStrokeCap: CircularStrokeCap.round,
                      percent: percentInt / 100,
                      progressColor: AppColors.buttoncolour,
                      addAutomaticKeepAlive: false,
                      backgroundColor: const Color(0xffFFE3F0),
                      center: text707070_12w400('$percentInt%'),
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 0.50,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFE0E0E0)),
                    ),
                  ),
                ),
                sizedBoxHeight(8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text707070_12w400('12 June , Monday'),
                    Container(
                      height: 26.h,
                      width: 0.5,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFE0E0E0),
                          ),
                        ),
                      ),
                    ),
                    text707070_12w400('11:15AM-11.45PM')
                  ],
                ),
                daysLeft
                    ? Column(
                        children: [
                          sizedBoxHeight(10.h),
                          Container(
                            width: 84,
                            height: 27,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFDE7EC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Center(
                              child: textEE3764_12w400('5 days left'),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
        sizedBoxHeight(15.h)
      ],
    );
  }

  Widget completedWidget() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(RouteName.completedTask);
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 3.w, right: 3.w),
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: const Color(0xFFEE3764),
                    spreadRadius: 0,
                    offset: Offset(-3.w, 0)),
                const BoxShadow(
                    color: Color(0x3F5B5B5B),
                    blurRadius: 4,
                    offset: Offset(0, 1))
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text373434_18w400Linethrough('Invitation Ideas'),
                    sizedBoxHeight(5.h),
                    Row(
                      children: [
                        Image.asset('assets/images/dp.png', width: 32.w),
                        sizedBoxWidth(8.w),
                        text373434_15w400('Virushka1234')
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                      right: 18.w, left: 8.w, top: 5.h, bottom: 5.h),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFDE7EC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 21.w,
                        height: 21.w,
                        decoration: const ShapeDecoration(
                          color: AppColors.buttoncolour,
                          shape: OvalBorder(),
                        ),
                        child: Icon(Icons.check,
                            color: AppColors.white, size: 15.w),
                      ),
                      sizedBoxWidth(8.w),
                      text373737_12w400('Task Completed'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        sizedBoxHeight(15.h)
      ],
    );
  }
}
