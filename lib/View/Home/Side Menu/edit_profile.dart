import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wedzy_captain/Utils/Common/getx_controller.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';
import 'package:wedzy_captain/Utils/Widgets/common_next_button.dart';
import 'package:wedzy_captain/Utils/Widgets/custom_form_container.dart';
import '../../../Utils/Common/texts.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});
  @override
  Widget build(BuildContext context) {
    final commonGetXController = Get.put(CommonGetXController());
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3 + 30.w,
              child: commonNextButton(
                'Save',
                onTap: () {
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
                    commonGetXController.changedNameValue();
                    Get.back();
                    Get.back();
                  });
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3 + 30.w,
              child: commonNextButtonReverse(
                'Cancel',
                onTap: () {
                  Get.back();
                },
              ),
            )
          ],
        ),
      ),
      backgroundColor: AppColors.white,
      appBar: const CustomAppBarDynamic(
          titleTxt: 'Edit Profile', preferredSize: Size.fromHeight(50)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            sizedBoxHeight(40.h),
            CustomFormContainer(
                controller: commonGetXController.nameController,
                leadingImage: 'assets/svg/user.svg',
                hintText: 'Enter Your Name'),
            sizedBoxHeight(23.h),
            CustomFormContainer(
                maxLength: 10,
                controller: commonGetXController.phoneController,
                leadingImage: 'assets/svg/phone.svg',
                txtinptype: TextInputType.phone,
                hintText: 'Enter Your Phone Number'),
            sizedBoxHeight(23.h),
            CustomFormContainer(
                controller: commonGetXController.emailController,
                leadingImage: 'assets/svg/email.svg',
                txtinptype: TextInputType.emailAddress,
                hintText: 'Enter Your Email Id'),
            sizedBoxHeight(23.h),
            const CustomFormContainer(
                leadingImage: 'assets/svg/dob.svg',
                txtinptype: TextInputType.datetime,
                maxLength: 8,
                hintText: 'Date Of Birth'),
            sizedBoxHeight(23.h),
            const CustomFormContainer(
                leadingImage: 'assets/svg/gender.svg', hintText: 'Gender'),
            sizedBoxHeight(23.h),
            CustomFormContainer(
                controller: commonGetXController.addressController,
                leadingImage: 'assets/svg/location.svg',
                hintText: 'Enter Your Address'),
          ],
        ),
      ),
    );
  }
}
