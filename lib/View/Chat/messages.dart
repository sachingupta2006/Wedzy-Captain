import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wedzy_captain/Routes/route_name.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';
import 'package:wedzy_captain/Utils/Widgets/common_next_button.dart';

class Messagepage extends StatefulWidget {
  const Messagepage({super.key});

  @override
  State<Messagepage> createState() => _MessagepageState();
}

class _MessagepageState extends State<Messagepage> {
  var showingAdditionalDetails = false.obs;
  var selectedChat = (-1).obs;

  buildDeletedialog(context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                sizedBoxHeight(15.h),
                textBlack12w400Center(
                    'Are You Sure You Want To Delete The task?'),
                sizedBoxHeight(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 110.w,
                        child: commonNextButton('Yes', onTap: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return WillPopScope(
                                onWillPop: () async => false,
                                child: AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      LottieBuilder.asset(
                                        'assets/json/delete.json',
                                        height: 100.h,
                                        width: 100.h,
                                      ),
                                      text373434_15w400Center(
                                          'Your task have been Deleted sucessfully!'),
                                      sizedBoxHeight(30.h)
                                    ],
                                  ),
                                ),
                              );
                            },
                          );

                          Timer(const Duration(seconds: 3), () {
                            Get.back();
                            Get.back();
                            showingAdditionalDetails.value = false;
                            selectedChat.value = -1;
                          });
                        })),
                    SizedBox(
                        width: 110.w,
                        child: commonNextButtonReverse(
                          'No',
                          onTap: () {
                            Get.back();
                          },
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List chatDatatoday = [
    {
      // "index": 1,
      "image": "assets/images/chatimage.png",
      "tittle": "Virat & Anushka",
      "subtitle": "Lorem ipsum dolor sit......",
    },
    {
      // "index": 2,
      "image": "assets/images/chatimage1.png",
      "tittle": "Ranbir & Alia",
      "subtitle": "Lorem ipsum dolor sit......",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarDynamic(
          titleTxt: "Chats",
          preferredSize: Size.fromHeight(50),
          search: true,
          backArrow: false,
          suffixWidget: Obx(
            () => showingAdditionalDetails.value
                ? Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Row(
                      children: [
                        Visibility(
                            visible: showingAdditionalDetails.value,
                            child: InkWell(
                                onTap: () => buildDeletedialog(context),
                                child:
                                    SvgPicture.asset("assets/svg/Trash.svg"))),
                        sizedBoxWidth(10.w),
                        Visibility(
                            visible: showingAdditionalDetails.value,
                            child: InkWell(
                                onTap: () {
                                  // setState(() {
                                  showingAdditionalDetails.value = false;
                                  selectedChat.value = -1;
                                  // });
                                },
                                child: textbuutoncolor_14w400("Cancel")))
                      ],
                    ),
                  )
                : sizedBoxWidth(0.w),
          )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 18.w, right: 14.w, top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteName.chatgroupselectmembers);
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.buttoncolour,
                      radius: 26.w,
                      child: CircleAvatar(
                        radius: 24.5.w,
                        backgroundColor: Colors.white,
                        child: Image.asset("assets/images/plus.png"),
                      ),
                    ),
                    sizedBoxWidth(12.w),
                    Text(
                      'Create a new group',
                      style: TextStyle(
                        color: Color(0xFFEE3764),
                        fontSize: 16.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              sizedBoxHeight(12.h),
              Text(
                'Today',
                style: TextStyle(
                  color: Color(0xFF373434),
                  fontSize: 15.sp,
                  fontFamily: 'AvenirNextCyr',
                  fontWeight: FontWeight.w400,
                ),
              ),
              sizedBoxHeight(18.h),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 1,
                    color: Color(0x66F05E90),
                  );
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: chatDatatoday.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      todaytile(
                          chatDatatoday[index]["image"],
                          chatDatatoday[index]["tittle"],
                          chatDatatoday[index]["subtitle"],
                          index, () {
                        showingAdditionalDetails.value = true;
                        selectedChat.value = (index);
                        print(selectedChat.value);
                      }),
                      sizedBoxHeight(12.h),
                    ],
                  );
                },
              ),
              sizedBoxHeight(20.h),
              Text(
                'Yesterday',
                style: TextStyle(
                  color: Color(0xFF373434),
                  fontSize: 15.sp,
                  fontFamily: 'AvenirNextCyr',
                  fontWeight: FontWeight.w400,
                ),
              ),
              sizedBoxHeight(6.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25, // Image radius
                      backgroundImage:
                          AssetImage("assets/images/chatimage2.png"),
                    ),
                    sizedBoxWidth(25.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vicky & Katrina",
                          style: TextStyle(
                            color: Color(0xFF373737),
                            fontSize: 15.sp,
                            fontFamily: 'AvenirNextCyr',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Lorem ipsum dolor sit......",
                          style: TextStyle(
                            color: Color(0xFF9B9B9B),
                            fontSize: 15.sp,
                            fontFamily: 'AvenirNextCyr',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    sizedBoxWidth(10.w),
                    Text(
                      '1 May',
                      style: TextStyle(
                        color: Color(0xFF9B9B9B),
                        fontSize: 12.sp,
                        fontFamily: 'AvenirNextCyr',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              sizedBoxHeight(12.h),
              Divider(
                thickness: 1,
                color: Color(0x66F05E90),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget todaytile(
      dynamic image, dynamic tittle, dynamic subtitle, int index, onLongPress) {
    // var isSelected = false.obs;
    return Column(
      children: [
        Obx(
          () => InkWell(
            onTap: () {
              Get.toNamed(RouteName.chatbox);
            },
            onLongPress: onLongPress,
            //  () {
            // setState(() {
            // showingAdditionalDetails.value = true;
            // isSelected.value = true;
            // chatDatatoday[index] ? isSelected.value = true : false;
            // });
            // },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: selectedChat.value == index
                      ? Colors.red[100]
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Visibility(
                  //     visible: showingAdditionalDetails,
                  //     child: Icon(
                  //       showingAdditionalDetails
                  //           ? Icons.check_box
                  //           : Icons.check_box_outline_blank,
                  //       color: AppColors.buttoncolour,
                  //     )),
                  // sizedBoxWidth(2.w),
                  CircleAvatar(
                    radius: 25, // Image radius
                    backgroundImage: AssetImage(image),
                  ),
                  sizedBoxWidth(25.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tittle,
                        style: TextStyle(
                          color: Color(0xFF373737),
                          fontSize: 15.sp,
                          fontFamily: 'AvenirNextCyr',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 15.sp,
                          fontFamily: 'AvenirNextCyr',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  sizedBoxWidth(10.w),
                  Text(
                    '10.20 AM',
                    style: TextStyle(
                      color: Color(0xFF373434),
                      fontSize: 12.sp,
                      fontFamily: 'AvenirNextCyr',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
