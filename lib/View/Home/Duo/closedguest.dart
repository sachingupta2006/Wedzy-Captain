import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';

class ClosedGuest extends StatefulWidget {
  const ClosedGuest({super.key});

  @override
  State<ClosedGuest> createState() => _ClosedGuestState();
}

class _ClosedGuestState extends State<ClosedGuest> {
  final ScrollController _scrollController = ScrollController();
  List closedguestdata = [
    {
      "tittle": "Namrata Burondkar",
      "subtitle": "Sister",
      "endtext": "1234567890",
    },
    {
      "tittle": "Vinodhini Vijayaraj",
      "subtitle": "Mother",
      "endtext": "1234567890",
    },
    {
      "tittle": "Aishwarya Raut",
      "subtitle": "Friend",
      "endtext": "1234567890",
    },
    {
      "tittle": "Prachi Jadhav",
      "subtitle": "Friend",
      "endtext": "1234567890",
    },
    {
      "tittle": "Mokshada Kesarkar",
      "subtitle": "Elder Sister",
      "endtext": "1234567890",
    },
    {
      "tittle": "Pooja Tambe",
      "subtitle": "Grandma",
      "endtext": "1234567890",
    },
    {
      "tittle": "Mayur Naik",
      "subtitle": "Brother",
      "endtext": "1234567890",
    },
    {
      "tittle": "Chaitali Tatkekar",
      "subtitle": "Aunt",
      "endtext": "1234567890",
    },
    {
      "tittle": "Namrata Burondkar",
      "subtitle": "Sister",
      "endtext": "1234567890",
    },
    {
      "tittle": "Vinodhini Vijayaraj",
      "subtitle": "Mother",
      "endtext": "1234567890",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBarDynamic(
        titleTxt: "View Guests",
        preferredSize: const Size.fromHeight(50),
        search: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
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
              text373434_15w700("Closed Ones"),
              sizedBoxHeight(6.h),
              Container(
                width: 94,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFEE3764),
                    ),
                  ),
                ),
              ),
              sizedBoxHeight(16.h),
              Container(
                width: double.infinity,
                height: 520.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey.shade200)),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 1,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Scrollbar(
                        thickness: 3,
                        controller: _scrollController,
                        isAlwaysShown: true,
                        child: ListView.separated(
                          controller: _scrollController,
                          scrollDirection: Axis.vertical,
                          separatorBuilder: (context, index) {
                            return Divider(
                              thickness: 0.50,
                              color: Color(0x66F05E90),
                            );
                          },
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: closedguestdata.length,
                          itemBuilder: (context, index) {
                            return closedcontainer(
                                closedguestdata[index]["tittle"],
                                closedguestdata[index]["subtitle"],
                                closedguestdata[index]["endtext"]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sizedBoxHeight(40.h),
            ],
          ),
        ),
      )),
    );
  }

  Widget closedcontainer(dynamic tittle, dynamic subtitle, dynamic endtext) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 160.w, child: text373434_15w400(tittle)),
              sizedBoxHeight(2.h),
              text7070770_14w400(subtitle),
            ],
          ),
          sizedBoxWidth(27.w),
          SvgPicture.asset("assets/svg/phonecallclosed.svg"),
          sizedBoxWidth(10.w),
          text7070770_14w400(endtext),
        ],
      ),
    );
  }
}
