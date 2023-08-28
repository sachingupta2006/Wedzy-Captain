import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wedzy_captain/Routes/route_name.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';
import 'package:wedzy_captain/Utils/Widgets/common_next_button.dart';

class Chatgroupmembersselect extends StatefulWidget {
  const Chatgroupmembersselect({super.key});

  @override
  State<Chatgroupmembersselect> createState() => _ChatgroupmembersselectState();
}

class _ChatgroupmembersselectState extends State<Chatgroupmembersselect> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBarDynamic(
          search: true,
          titleTxt: "New Group",
          preferredSize: Size.fromHeight(120),
          useCustomWidget: true,
          customWidget: Column(
            children: [
              Align(
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
              sizedBoxHeight(10.h),
              Stack(children: [
                TabBar(
                    dividerColor: Color(0xFFF05E90),
                    indicatorColor: AppColors.buttoncolour,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    labelPadding: EdgeInsets.symmetric(vertical: 4.h),
                    indicatorWeight: 3,
                    tabs: [
                      text373434_15w400('Duo'),
                      text373434_15w400('Vendors'),
                    ]),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: -8.h,
                    child: const Divider(
                      thickness: 0.25,
                      color: AppColors.buttoncolour,
                    ))
              ]),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(children: [Duotab(), Vendorstab()]),
        ),
        // body:
        // Column(
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.only(left: 48.w),
        //       child: Text(
        //         'Add Participants',
        //         style: TextStyle(
        //           color: Color(0xFF707070),
        //           fontSize: 15.sp,
        //           fontFamily: 'AvenirNextCyr',
        //           fontWeight: FontWeight.w400,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class Vendorstab extends StatefulWidget {
  const Vendorstab({super.key});

  @override
  State<Vendorstab> createState() => _VendorstabState();
}

class _VendorstabState extends State<Vendorstab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            sizedBoxHeight(20.h),
            ListWidget("assets/images/Ellipse 1191.png", "Namrata Burondkar"),
            Separator_border(),
            ListWidget(
              "assets/images/Ellipse 1192.png",
              "Vinodhini Vijayaraj",
            ),
            Separator_border(),
            ListWidget("assets/images/Ellipse 1193.png", "Aishwarya Raut"),
            Separator_border(),
            ListWidget("assets/images/Ellipse 1194.png", "Prachi Jadhav"),
            Separator_border(),
            ListWidget("assets/images/Ellipse 1195.png", "Mokshada Kesarkar"),
            Separator_border(),
            ListWidget("assets/images/Ellipse 1197.png", "Mayur Naik"),
            sizedBoxHeight(50.h),
            commonNextButton("Next", onTap: () {
              Get.toNamed(RouteName.chatgroupselected);
            }),
            sizedBoxHeight(50.h),
          ],
        ),
      ),
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

class Duotab extends StatefulWidget {
  const Duotab({super.key});

  @override
  State<Duotab> createState() => _DuotabState();
}

class _DuotabState extends State<Duotab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            sizedBoxHeight(20.h),
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
              Get.toNamed(RouteName.chatgroupselected);
            }),
            sizedBoxHeight(50.h),
          ],
        ),
      ),
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
