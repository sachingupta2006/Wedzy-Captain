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
import 'package:wedzy_captain/View/Home/custom_bottombar.dart';

class Duodetails extends StatefulWidget {
  const Duodetails({super.key});

  @override
  State<Duodetails> createState() => _DuodetailsState();
}

class _DuodetailsState extends State<Duodetails> {
  buildarchievedialog(context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: Get.isDarkMode ? Colors.black : Color(0XFFFFFFFF),
            contentPadding: EdgeInsets.fromLTRB(32, 35, 32, 28),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(
                  color: Get.isDarkMode ? Colors.grey : Color(0XFFFFFFFF)),
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //sizedBoxHeight(32.h),

                Align(
                    alignment: Alignment.center,
                    child: text373434_15w400(
                        "Are you sure you want to \n     archive the details?")),

                sizedBoxHeight(30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                          buildarchieve2dialog(context);
                        },
                        child: Container(
                          width: 117.w,
                          height: 45.h,
                          decoration: ShapeDecoration(
                            color: Color(0xFFEF2B7B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Yes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontFamily: 'AvenirNextCyr',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        )),
                    sizedBoxWidth(28.w),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 117.w,
                          height: 45.h,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFFEF2B7B)),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'No',
                                style: TextStyle(
                                  color: Color(0xFFEF2B7B),
                                  fontSize: 15.sp,
                                  fontFamily: 'AvenirNextCyr',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
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

  buildarchieve2dialog(context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: Get.isDarkMode ? Colors.black : Color(0XFFFFFFFF),
            contentPadding: EdgeInsets.fromLTRB(32, 15, 32, 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(
                  color: Get.isDarkMode ? Colors.grey : Color(0XFFFFFFFF)),
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                            "assets/svg/cancelbuttoncolor.svg"))),
                Align(
                    alignment: Alignment.center,
                    child: Lottie.asset(
                      "assets/json/tick.json",
                      height: 130.h,
                      width: 130.h,
                    )),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Details have been saved sucessfully!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF373434),
                      fontSize: 12.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                sizedBoxHeight(30.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBarDynamic(
        search: false,
        titleTxt: "Duo Details",
        suffixWidget: GestureDetector(
          onTap: () => buildarchievedialog(context),
          child: Row(
            children: [
              SvgPicture.asset("assets/svg/duodetailsarchieve.svg"),
              sizedBoxWidth(9.w),
              Padding(
                  padding: EdgeInsets.only(right: 17.w),
                  child: Text(
                    'Archive Duo',
                    style: TextStyle(
                      color: Color(0xFF373434),
                      fontSize: 12.sp,
                      fontFamily: 'AvenirNextCyr',
                      fontWeight: FontWeight.w400,
                    ),
                  ))
            ],
          ),
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 155,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/duodetailsback.png"),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.grey.withOpacity(0.7), BlendMode.modulate)),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F5B5B5B),
                        blurRadius: 4,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Virat & Anushka',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontFamily: 'AvenirNextCyr',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        sizedBoxHeight(5.h),
                        Text(
                          '25 December 2023',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontFamily: 'AvenirNextCyr',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 94,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 328,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE7F2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              text373434_18w700("487"),
                              sizedBoxHeight(1.h),
                              text707070_12w400("days")
                            ],
                          ),
                          sizedBoxWidth(15.w),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: VerticalDivider(
                              color: AppColors.buttoncolour,
                              width: 1,
                              thickness: 1,
                            ),
                          ),
                          sizedBoxWidth(15.w),
                          Column(
                            children: [
                              text373434_18w700("23"),
                              sizedBoxHeight(1.h),
                              text707070_12w400("hours")
                            ],
                          ),
                          sizedBoxWidth(15.w),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: VerticalDivider(
                              color: AppColors.buttoncolour,
                              width: 1,
                              thickness: 1,
                            ),
                          ),
                          sizedBoxWidth(15.w),
                          Column(
                            children: [
                              text373434_18w700("39"),
                              sizedBoxHeight(1.h),
                              text707070_12w400("min")
                            ],
                          ),
                          sizedBoxWidth(15.w),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: VerticalDivider(
                              color: AppColors.buttoncolour,
                              width: 1,
                              thickness: 1,
                            ),
                          ),
                          sizedBoxWidth(15.w),
                          Column(
                            children: [
                              text373434_18w700("06"),
                              sizedBoxHeight(1.h),
                              text707070_12w400("sec")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            sizedBoxHeight(20.h),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 3.w, right: 3.w),
              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
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
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset("assets/svg/duodetails1.svg"),
                  sizedBoxWidth(15.w),
                  Column(
                    children: [
                      text707070_15w400("Overall Budget"),
                      text373434_18w700("₹ 20,00,000")
                    ],
                  ),
                  sizedBoxWidth(43.w),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteName.budgetpage);
                    },
                    child: Container(
                      width: 95,
                      height: 34,
                      decoration: ShapeDecoration(
                        color: Color(0xFFEF2B7B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'View',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            sizedBoxHeight(12.h),
            Container(
              width: 122,
              height: 36,
              decoration: ShapeDecoration(
                color: Color(0xFFFFE7F2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [text373434_15w400("Bride Details")],
              ),
            ),
            sizedBoxHeight(12.h),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 3.w, right: 3.w),
              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x68EE3764),
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
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/Ellipse 1186 (2).png",
                        // width: 55.w,
                        // height: 55.h,
                      ),
                      sizedBoxWidth(49.w),
                      Text(
                        'Anushka Sharma',
                        style: TextStyle(
                          color: Color(0xFFEF2B7B),
                          fontSize: 18.sp,
                          fontFamily: 'AvenirNextCyr',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  sizedBoxHeight(12.h),
                  Divider(
                    thickness: 1,
                    color: Color(0x77F05E90),
                  ),
                  sizedBoxHeight(22.h),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text373434_15w700("Phone"),
                      sizedBoxWidth(48.w),
                      text16w500monbla(':'),
                      sizedBoxWidth(14.w),
                      text707070_15w400("1234567890")
                    ],
                  ),
                  sizedBoxHeight(26.h),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text373434_15w700("Email id"),
                      sizedBoxWidth(48.w),
                      text16w500monbla(':'),
                      sizedBoxWidth(14.w),
                      text707070_15w400("anushka@gmail.com")
                    ],
                  ),
                  sizedBoxHeight(26.h),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text373434_15w700("Location"),
                      sizedBoxWidth(48.w),
                      text16w500monbla(':'),
                      sizedBoxWidth(14.w),
                      text707070_15w400("Bandra west")
                    ],
                  ),
                  sizedBoxHeight(26.h),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text373434_15w700("Hashtag"),
                      sizedBoxWidth(48.w),
                      text16w500monbla(':'),
                      sizedBoxWidth(14.w),
                      Container(
                        width: 76,
                        height: 26,
                        decoration: ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '# Lorem',
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 15.sp,
                                fontFamily: 'AvenirNextCyr',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            sizedBoxHeight(17.h),
            Container(
              width: 122,
              height: 36,
              decoration: ShapeDecoration(
                color: Color(0xFFFFE7F2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [text373434_15w400("Groom Details")],
              ),
            ),
            sizedBoxHeight(12.h),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 3.w, right: 3.w),
              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x68EE3764),
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
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/Ellipse 1190.png",
                        // width: 55.w,
                        // height: 55.h,
                      ),
                      sizedBoxWidth(49.w),
                      Text(
                        'Virat Kohli',
                        style: TextStyle(
                          color: Color(0xFFEF2B7B),
                          fontSize: 18.sp,
                          fontFamily: 'AvenirNextCyr',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  sizedBoxHeight(12.h),
                  Divider(
                    thickness: 1,
                    color: Color(0x77F05E90),
                  ),
                  sizedBoxHeight(22.h),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text373434_15w700("Phone"),
                      sizedBoxWidth(48.w),
                      text16w500monbla(':'),
                      sizedBoxWidth(14.w),
                      text707070_15w400("2234567890")
                    ],
                  ),
                  sizedBoxHeight(26.h),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text373434_15w700("Email id"),
                      sizedBoxWidth(48.w),
                      text16w500monbla(':'),
                      sizedBoxWidth(14.w),
                      text707070_15w400("virat@gmail.com")
                    ],
                  ),
                  sizedBoxHeight(26.h),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text373434_15w700("Location"),
                      sizedBoxWidth(48.w),
                      text16w500monbla(':'),
                      sizedBoxWidth(14.w),
                      text707070_15w400("Bandra west")
                    ],
                  ),
                  sizedBoxHeight(26.h),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text373434_15w700("Hashtag"),
                      sizedBoxWidth(48.w),
                      text16w500monbla(':'),
                      sizedBoxWidth(14.w),
                      Container(
                        width: 76,
                        height: 26,
                        decoration: ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '# Lorem',
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 15.sp,
                                fontFamily: 'AvenirNextCyr',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            sizedBoxHeight(23.h),
            Duocard(
                leadingimage: "assets/svg/duodetails2.svg",
                ontap: () {
                  Get.toNamed(RouteName.mangepayments);
                },
                title: "Manage Payments"),
            sizedBoxHeight(18.h),
            Duocard(
                leadingimage: "assets/svg/duodetails3.svg",
                ontap: () {
                  Get.toNamed(RouteName.mangevendors);
                },
                title: "Manage Vendors"),
            sizedBoxHeight(18.h),
            Duocard(
                leadingimage: "assets/svg/duodetails4.svg",
                ontap: () {
                  Get.toNamed(RouteName.closedguest);
                },
                title: "View Guests"),
            sizedBoxHeight(18.h),
            Duocard(
                leadingimage: "assets/svg/duodetails5.svg",
                ontap: () {
                  Get.back();

                  selectedIndexBottomBar.value = 0;
                },
                title: "Manage Tasks"),
            sizedBoxHeight(30.h),
          ],
        ),
      )),
    );
  }
}

class Duocard extends StatelessWidget {
  Duocard({
    Key? key,
    required this.leadingimage,
    required this.title,
    this.ontap,
  }) : super(key: key);

  final String leadingimage;
  final String title;

  final GestureTapCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap!.call();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        height: 74,
        decoration: ShapeDecoration(
          color: Color(0xFFFEF3F8),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50, color: Color(0xFFEE3764)),
            borderRadius: BorderRadius.circular(8),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3FACA9A9),
              blurRadius: 4,
              offset: Offset(2, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.buttoncolour,
              child: CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.white,
                child: SvgPicture.asset(leadingimage),
              ),
            ),
            sizedBoxWidth(16.w),
            SizedBox(width: 155.w, child: text373434_18w700(title)),
            sizedBoxWidth(40.w),
            SvgPicture.asset("assets/svg/duodetailsarrow.svg")
          ],
        ),
      ),
    );
  }
}
