import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedzy_captain/Routes/route_name.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';
import 'package:wedzy_captain/Utils/Widgets/common_next_button.dart';

class ManageGuest extends StatefulWidget {
  const ManageGuest({super.key});

  @override
  State<ManageGuest> createState() => _ManageGuestState();
}

class _ManageGuestState extends State<ManageGuest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBarDynamic(
        titleTxt: "Manage Guests",
        preferredSize: const Size.fromHeight(50),
        search: false,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            sizedBoxHeight(20.h),
            Container(
              width: double.infinity,
              height: 50,
              decoration: ShapeDecoration(
                color: Color(0xFFFEF3F8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.buttoncolour,
                      child: CircleAvatar(
                        radius: 16.5,
                        backgroundColor: Color(0xFFFEF3F8),
                        child: SvgPicture.asset(
                          "assets/svg/duodetails4.svg",
                          width: 30.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                    sizedBoxWidth(17.w),
                    text707070_15w400("Total Guest Count :"),
                    sizedBoxWidth(12.w),
                    text373434_18w700("120")
                  ],
                ),
              ),
            ),
            sizedBoxHeight(20.h),
            Container(
              width: double.infinity,
              height: 170.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: AppColors.buttoncolour,
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text373434_15w400("Add Closed Ones"),
                    sizedBoxHeight(8.h),
                    text373434_14w400(
                        "Rorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et"),
                    sizedBoxHeight(14.h),
                    commonNextButton(
                      "Add",
                      onTap: () {
                      Get.toNamed(RouteName.closedguest);

                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
