import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';
import 'package:wedzy_captain/Utils/Widgets/common_next_button.dart';
import 'package:wedzy_captain/Utils/Widgets/custom_form_container.dart';
import '../../../Utils/Common/sized_box.dart';
import '../../../Utils/Common/texts.dart';
import '../../../Utils/Common/themedata.dart';
import '../../../Utils/Widgets/custom_date_picker.dart';
import '../../../Utils/Widgets/custom_time_picker.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBarDynamic(
          titleTxt: 'Add Task', preferredSize: Size.fromHeight(50)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxHeight(15.h),
            text373434_14w400Montserrat('Duo ID'),
            sizedBoxHeight(5.h),
            const CustomFormContainer(hintText: 'Enter Duo Id'),
            sizedBoxHeight(20.h),
            text373434_14w400Montserrat('Task Name'),
            sizedBoxHeight(5.h),
            const CustomFormContainer(hintText: 'Enter Task Name'),
            sizedBoxHeight(20.h),
            text373434_14w400Montserrat('Date'),
            sizedBoxHeight(5.h),
            CustomDatePicker(),
            sizedBoxHeight(20.h),
            text373434_14w400Montserrat('Time'),
            sizedBoxHeight(5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 32.w,
                    child: const CustomTimePicker(txt: 'Start')),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 32.w,
                    child: const CustomTimePicker(txt: 'End')),
              ],
            ),
            sizedBoxHeight(20.h),
            Row(
              children: [
                Container(
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 0.50, color: Color(0xFFF05E90)))),
                  child: Icon(Icons.add, size: 18.h),
                ),
                sizedBoxWidth(5.w),
                text373434_14w400Montserrat('Add new agenda')
              ],
            ),
            Divider(
                color: AppColors.buttoncolour, thickness: 0.25, height: 30.h),
            text373434_14w400Montserrat('Notes'),
            sizedBoxHeight(5.h),
            Stack(
              children: [
                TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            bottom: 8.h, top: 10.h, left: 8.w, right: 50.w),
                        hintText: 'Add notes...',
                        hintStyle: const TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.buttoncolour, width: 1)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.buttoncolour, width: 1)),
                        disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.buttoncolour, width: 1)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.buttoncolour, width: 1))),
                    maxLines: 5),
                Positioned(
                    right: 5.w,
                    top: 10.w,
                    child: Transform.rotate(
                        angle: 145, child: const Icon(Icons.attach_file)))
              ],
            ),
            sizedBoxHeight(23.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 32.w,
                    child: commonNextButton('Save', onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return changesAlert(context, 'Save');
                        },
                      );
                    })),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 32.w,
                    child: commonNextButtonReverse('Cancel', onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return changesAlert(context, 'Cancel');
                        },
                      );
                    })),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

AlertDialog changesAlert(context, String txt) {
  return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        sizedBoxHeight(15.h),
        textBlack12w400Center('Are You Sure You Want To $txt The Changes?'),
        sizedBoxHeight(20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 110.w,
                child: commonNextButton(
                  'Yes',
                  onTap: txt == 'Save'
                      ? () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return WillPopScope(
                                onWillPop: () async => false,
                                child: AlertDialog(
                                  // title: Row(
                                  //   mainAxisAlignment: MainAxisAlignment.end,
                                  //   children: [
                                  //     Icon(Icons.cancel_outlined,
                                  //         color: AppColors.buttoncolour, size: 18.sp),
                                  //   ],
                                  // ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      LottieBuilder.asset(
                                        'assets/json/tick.json',
                                        height: 100.h,
                                        width: 100.h,
                                      ),
                                      text373434_15w400Center(
                                          'Details have been saved sucessfully!'),
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
                        }
                      : () {
                          Get.back();
                          Get.back();
                        },
                )),
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
