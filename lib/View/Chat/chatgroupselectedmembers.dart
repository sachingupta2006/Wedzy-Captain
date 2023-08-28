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

class Chatgroupselectedmembers extends StatefulWidget {
  const Chatgroupselectedmembers({super.key});

  @override
  State<Chatgroupselectedmembers> createState() =>
      _ChatgroupselectedmembersState();
}

class _ChatgroupselectedmembersState extends State<Chatgroupselectedmembers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarDynamic(
        titleTxt: "New Group",
        preferredSize: Size.fromHeight(70),
        useCustomWidget: true,
        customWidget: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 48.w),
            child: Text(
              'Add Participants',
              style: TextStyle(
                color: Color(0xFF707070),
                fontSize: 15.sp,
                fontFamily: 'AvenirNextCyr',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            sizedBoxHeight(25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 51,
                            height: 51,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/Ellipse 1186 (2).png"),
                                fit: BoxFit.fill,
                              ),
                              shape: OvalBorder(
                                  // side: BorderSide(color: Color(0xFF373434)),
                                  ),
                            ),
                          ),
                          Positioned(
                              bottom: 32.h,
                              right: -3.h,
                              child:
                                  SvgPicture.asset("assets/svg/x-circle.svg"))
                        ],
                      ),
                      Text(
                        "Anushka",
                        style: TextStyle(
                          color: Color(0xFF373737),
                          fontSize: 15.sp,
                          fontFamily: 'AvenirNextCyr',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  sizedBoxWidth(32.w),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 51,
                            height: 51,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/Ellipse 1190.png"),
                                fit: BoxFit.fill,
                              ),
                              shape: OvalBorder(
                                  // side: BorderSide(color: Color(0xFF373434)),
                                  ),
                            ),
                          ),
                          Positioned(
                              bottom: 32.h,
                              right: -3.h,
                              child:
                                  SvgPicture.asset("assets/svg/x-circle.svg"))
                        ],
                      ),
                      Text(
                        "Virat",
                        style: TextStyle(
                          color: Color(0xFF373737),
                          fontSize: 15.sp,
                          fontFamily: 'AvenirNextCyr',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sizedBoxHeight(40.h),
            ListWidget("assets/images/Ellipse 1185.png", "Alia"),
            Separator_border(),
            ListWidget("assets/images/Ellipse 1186 (2).png", "Anushka"),
            Separator_border(),
            ListWidget("assets/images/Ellipse 1187 (2).png", "Katrina"),
            Separator_border(),
            ListWidget("assets/images/Ellipse 1188.png", "Ranbir"),
            Separator_border(),
            ListWidget("assets/images/image 14.png", "Vicky"),
            Separator_border(),
            ListWidget("assets/images/Ellipse 1190.png", "Virat"),
            sizedBoxHeight(50.h),
            commonNextButton("Next", onTap: () {
              Get.toNamed(RouteName.chatgroupname);
            }),
            sizedBoxHeight(50.h),
          ],
        ),
      )),
    );
  }

  Widget ListWidget(image, title) {
    var profileBool = false.obs;

    return ListTile(
      onTap: () {},
      leading: Container(
        width: 48,
        height: 48,
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
          shape: OvalBorder(
              // side: BorderSide(color: Color(0xFF373434)),
              ),
        ),
      ),
      title: textBlack15w700(title),
      trailing: GestureDetector(
        onTap: () {
          profileBool.value = !profileBool.value;
        },
        child: CircleAvatar(
          radius: 11.h,
          backgroundColor: Color.fromARGB(255, 248, 91, 131),
          child: CircleAvatar(
            radius: 9.h,
            backgroundColor: AppColors.white,
            child: Obx(() => CircleAvatar(
                  radius: 6.h,
                  backgroundColor: profileBool.value
                      ? AppColors.buttoncolour
                      : AppColors.white,
                )),
          ),
        ),
      ),
    );
  }

  Widget Separator_border() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 15,
      ),
      child: Container(
        width: 324,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.7,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color.fromARGB(75, 240, 94, 145),
            ),
          ),
        ),
      ),
    );
  }
}
