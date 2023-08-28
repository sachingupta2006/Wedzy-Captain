import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';
import '../../../Utils/Widgets/common_next_button.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController teController = TextEditingController(
        text:
            'Rorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et');
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBarDynamic(
          suffixWidget: Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: PopupMenuButton(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.05, color: Color(0xFFBFBFBF)),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Icon(
                  Icons.more_vert,
                  color: AppColors.buttoncolour,
                ),
                onSelected: (value) {
                  value == 'Share'
                      ? share()
                      : value == 'Delete'
                          ? showDialog(
                              context: context,
                              builder: (context) {
                                return deleteAlert(context);
                              },
                            )
                          : value == 'Edit'
                              ? Get.back()
                              : Get.back();
                },
                itemBuilder: (BuildContext context) {
                  return [
                    // popuIitems('Edit'),
                    popuIitems('Share'),
                    popuIitems('Delete', divider: false),
                  ];
                }),
          ),
          titleTxt: 'Completed Task',
          preferredSize: const Size.fromHeight(50)),
      // bottomNavigationBar: commonNextButton('Mark As Completed', margin: 16.w),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxHeight(10.h),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text373434_15w700('Duo-id'),
                    sizedBoxHeight(23.h),
                    text373434_15w700('Duo-name'),
                    sizedBoxHeight(23.h),
                    text373434_15w700('Task name'),
                    sizedBoxHeight(23.h),
                    text373434_15w700('Date'),
                    sizedBoxHeight(23.h),
                    text373434_15w700('Time'),
                    sizedBoxHeight(23.h),
                  ],
                ),
                sizedBoxWidth(20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text373434_15w400(':   Virushka1234'),
                    sizedBoxHeight(23.h),
                    text373434_15w400(':   Virat & Anushka'),
                    sizedBoxHeight(23.h),
                    text373434_15w400(':   Invitation Ideas'),
                    sizedBoxHeight(23.h),
                    text373434_15w400(':   19-06-2023'),
                    sizedBoxHeight(23.h),
                    text373434_15w400(':   11 : 00 AM- 11 : 45AM'),
                    sizedBoxHeight(23.h),
                  ],
                )
              ],
            ),
            Row(
              children: [
                text373434_15w700('Agenda'),
                sizedBoxWidth(6.w),
                textEF2B7B_14w400Montserrat('(3)')
              ],
            ),
            Divider(
                height: 30.h, color: AppColors.buttoncolour, thickness: 0.25),
            tickTaskWidget(),
            tickTaskWidget(),
            tickTaskWidget(),
            text373434_15w700('Notes'),
            sizedBoxHeight(15.h),
            Container(
              decoration: ShapeDecoration(
                color: const Color(0x00D9D9D9),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.50, color: Color(0xFFF05E90)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      TextFormField(
                        controller: teController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                bottom: 8.h, top: 10.h, left: 8.w, right: 50.w),
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                        maxLines: 10,
                        minLines: 2,
                      ),
                      Positioned(
                          right: 5.w,
                          top: 10.w,
                          child: Transform.rotate(
                              angle: 145, child: const Icon(Icons.attach_file)))
                    ],
                  ),
                  sizedBoxHeight(15.h),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10.w),
                        padding: EdgeInsets.all(10.w),
                        height: 60.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0xFFE6E6E6)),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/sampleImage.png'),
                                sizedBoxWidth(5.w),
                                text373737_12w400('Img.jpg'),
                              ],
                            ),
                            sizedBoxWidth(7.w),
                            Icon(Icons.cancel_outlined, size: 10.h)
                          ],
                        ),
                      ),
                      sizedBoxWidth(10.w),
                      Container(
                        width: 21.w,
                        height: 60.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0xFFE6E6E6)),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 12.h,
                          ),
                        ),
                      )
                    ],
                  ),
                  sizedBoxHeight(15.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AlertDialog deleteAlert(context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          sizedBoxHeight(15.h),
          textBlack12w400Center('Are You Sure You Want To Delete The task?'),
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
                      Get.back();
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
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
      title: 'Example share',
      linkUrl: 'https://WedzyCaptain.com/',
    );
  }

  PopupMenuItem popuIitems(String txt,
      {
      // void Function()? onTap,
      bool divider = true}) {
    return PopupMenuItem(
        value: txt,
        padding: EdgeInsets.zero,
        height: 0,
        // onTap: onTap,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              sizedBoxHeight(6.h),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [sizedBoxWidth(18.w), text373434_14w500(txt)]),
              divider
                  ? Column(
                      children: [
                        Divider(
                            height: 20.h,
                            color: AppColors.secondary,
                            thickness: 0.25),
                      ],
                    )
                  : SizedBox(height: 6.w)
            ]));
  }

  Widget tickTaskWidget() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.75, color: Color(0xFFEE3764)),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              child: Center(
                child: Icon(Icons.check,
                    color: AppColors.buttoncolour, size: 15.sp),
              ),
            ),
            sizedBoxWidth(15.w),
            const Text(
              'Vorem ipsum dolor sit amet',
              style: TextStyle(
                color: Color(0xFF373434),
                fontSize: 15,
                fontFamily: 'AvenirNextCyr',
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        sizedBoxHeight(20.h)
      ],
    );
  }
}
