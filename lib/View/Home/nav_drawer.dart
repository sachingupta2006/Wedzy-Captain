import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import '../../Routes/route_name.dart';
import '../../Utils/Common/getx_controller.dart';
import '../../Utils/Common/sized_box.dart';
import '../../Utils/Common/texts.dart';
import '../../Utils/Common/themedata.dart';
import 'Side Menu/profile_screen.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final commonGetXController = Get.put(CommonGetXController());
    var status = true.obs;
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFEF7F9),
          boxShadow: [
            BoxShadow(
              color: AppColors.buttoncolour,
              spreadRadius: 0,
              offset: Offset(7, 0),
            )
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), bottomRight: Radius.circular(40)),
        ),
        width: 240.w,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            sizedBoxHeight(30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    sizedBoxWidth(16.w),
                    CircleAvatar(
                      backgroundColor: AppColors.transparent,
                      radius: 35.h,
                      child: profilePicPath.value != ''
                          ? ClipOval(
                              child: Image(
                                image: FileImage(File(profilePicPath.value)),
                                fit: BoxFit.fill,
                              ),
                            )
                          : Image.asset('assets/images/dp.png',
                              fit: BoxFit.cover, height: 70.h),
                    ),
                    sizedBoxWidth(10.w),
                    GetBuilder<CommonGetXController>(
                      builder: (controller) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textBlack15w400(
                                commonGetXController.nameController.text != ''
                                    ? commonGetXController.nameController.text
                                    : 'Akanksha'),
                            sizedBoxHeight(3.h),
                            textBlack15w400(
                                commonGetXController.phoneController.text != ''
                                    ? commonGetXController.phoneController.text
                                    : '9478567854'),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.toNamed(RouteName.profileScreen);
                    },
                    child: SvgPicture.asset('assets/svg/edit.svg'),
                  ),
                )
              ],
            ),
            sizedBoxHeight(30.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconTitle(Icons.notifications_outlined, 'Notifications',
                    onTap: () {
                  Get.back();
                  Get.toNamed(RouteName.notifications);
                }),
                Column(
                  children: [
                    sizedBoxHeight(5.h),
                    Obx(
                      () => FlutterSwitch(
                        width: 50,
                        padding: 2,
                        height: 25,
                        value: status.value,
                        switchBorder: Border.all(
                            color: const Color(0xFFEF2B7B), width: 1.3),
                        toggleColor: status.value
                            ? AppColors.white
                            : const Color(0xFFEE3764),
                        activeColor: const Color(0xFFEF2B7B),
                        inactiveColor: AppColors.white,
                        onToggle: (val) {
                          status.value = val;
                        },
                      ),
                    ),
                  ],
                ),
                sizedBoxWidth(0)
              ],
            ),
            iconTitle(Icons.lightbulb_outlined, 'Ideas', onTap: () {
              Get.back();
              Get.toNamed(RouteName.ideas);
            }),
            iconTitle(
              Icons.question_mark,
              "FAQ's",
              onTap: () {
                Get.back();
                Get.toNamed(RouteName.faqs);
              },
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    iconTitle(Icons.call_outlined, 'Contact Us', onTap: () {
                      Get.back();
                      Get.toNamed(RouteName.contactUs);
                    }),
                    iconTitle(Icons.emoji_emotions_outlined, 'Feedback',
                        onTap: () {
                      Get.back();
                      Get.toNamed(RouteName.feedback);
                    }),
                  ],
                ),
                const Spacer(),
                centerRightContainer(),
              ],
            ),
            iconTitle(
              Icons.info_outline,
              'About Us',
              onTap: () {
                Get.back();
                Get.toNamed(RouteName.aboutUs);
              },
            ),
            iconTitle(
              Icons.privacy_tip_outlined,
              'Privacy',
              onTap: () {
                Get.back();
                Get.toNamed(RouteName.privacy);
              },
            ),
            iconTitle(
              Icons.note_alt_sharp,
              'Terms & Conditions',
              onTap: () {
                Get.back();
                Get.toNamed(RouteName.termsCondition);
              },
            ),
            const Divider(color: AppColors.buttoncolour, thickness: 0.5),
            sizedBoxHeight(10.h),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          textBlack14w500('Are you sure you want to logout?'),
                          sizedBoxHeight(20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: text373434_14w500('Cancel')),
                              sizedBoxWidth(20.w),
                              InkWell(
                                  onTap: () {
                                    Get.back();
                                    Get.back();
                                    Get.toNamed(RouteName.onboarding);
                                  },
                                  child: textPrimary14w500('Logout')),
                            ],
                          ),
                          sizedBoxHeight(14.h),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Row(
                children: [
                  sizedBoxWidth(16.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Icon(Icons.logout_outlined,
                        color: AppColors.buttoncolour, size: 16.h),
                  ),
                  sizedBoxWidth(15.w),
                  textBlack16w500('Logout')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget centerRightContainer() {
    return Container(
      width: 20.w,
      height: 70.h,
      decoration: const BoxDecoration(
          color: AppColors.buttoncolour,
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(150, 180),
            bottomLeft: Radius.elliptical(150, 180),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          sizedBoxWidth(4.w),
          Container(
            height: 30.h,
            width: 4.w,
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(100))),
          ),
        ],
      ),
    );
  }

  Widget iconTitle(icon, String txt, {void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              sizedBoxWidth(16.w),
              Container(
                padding: EdgeInsets.all(7.h),
                decoration: ShapeDecoration(
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 2,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: AppColors.buttoncolour,
                    size: 16.h,
                  ),
                ),
              ),
              sizedBoxWidth(15.w),
              textBlack16w500(txt)
            ],
          ),
          sizedBoxHeight(30.h)
        ],
      ),
    );
  }
}
