import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedzy_captain/Routes/route_name.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';

class ManageDuo extends StatefulWidget {
  const ManageDuo({super.key});

  @override
  State<ManageDuo> createState() => _ManageDuoState();
}

class _ManageDuoState extends State<ManageDuo> {
  List containerdata = [
    {
      "image": "assets/images/chatimage.png",
      "tittle": "Virat & Anushka",
      "subtext1": "Virushka1234",
      "subtext2": "10 Lakh",
    },
    {
      "image": "assets/images/chatimage1.png",
      "tittle": "Alia & Ranbir",
      "subtext1": "Ranalia257",
      "subtext2": "20 Lakh",
    },
    {
      "image": "assets/images/chatimage2.png",
      "tittle": "Alia & Ranbir",
      "subtext1": "Vickat557",
      "subtext2": "10 Lakh",
    },
  ];

  Future _showSortdialog() async {
    FocusScope.of(context).unfocus();
    final data = await showModalBottomSheet<dynamic>(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 24),
          child: const Sortbottomsheet(),
        );
      },
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1, color: Color(0xFFEE3764),
          // Get.isDarkMode ? Colors.grey : Colors.white
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36),
          topRight: Radius.circular(36),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
    if (data != null) {
      setState(() {
        //  selectedIntrestedInInvesting = data;
      });
    }
  }

  Future _showfilterdialog() async {
    FocusScope.of(context).unfocus();
    final data = await showModalBottomSheet<dynamic>(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 24),
          child: const Filterbottomsheet(),
        );
      },
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1, color: Color(0xFFEE3764),
          // Get.isDarkMode ? Colors.grey : Colors.white
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36),
          topRight: Radius.circular(36),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
    if (data != null) {
      setState(() {
        //  selectedIntrestedInInvesting = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBarDynamic(
          search: true,
          titleTxt: 'Manage Duo',
          backArrow: false,
          suffixWidget: SizedBox(
            width: 70.w,
            child: Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () => _showSortdialog(),
                      child: SvgPicture.asset("assets/svg/Sort By.svg")),
                  InkWell(
                      onTap: () => _showfilterdialog(),
                      child: SvgPicture.asset("assets/svg/filter.svg")),
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(50)),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            sizedBoxHeight(12.h),
            ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 5.h,
                );
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: containerdata.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                    Get.toNamed(RouteName.duodetails);

                      },
                      child: duocard(
                        containerdata[index]["image"],
                        containerdata[index]["tittle"],
                        containerdata[index]["subtext1"],
                        containerdata[index]["subtext2"],
                      ),
                    ),
                    sizedBoxHeight(22.h),
                  ],
                );
              },
            )
          ],
        ),
      )),
    );
  }

  Widget duocard(
      dynamic image, dynamic tittle, dynamic subtext1, dynamic subtext2) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 3.w, right: 3.w),
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFFEE3764),
                  spreadRadius: 0,
                  offset: Offset(-3.w, 0)),
              const BoxShadow(
                  color: Color(0x3F5B5B5B), blurRadius: 4, offset: Offset(0, 1))
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25, // Image radius
                    backgroundImage: AssetImage(image),
                  ),
                  sizedBoxWidth(4.w),
                  SizedBox(
                    width: 140.w,
                    child: Text(
                      tittle,
                      style: TextStyle(
                        color: Color(0xFFEE3764),
                        fontSize: 18.sp,
                        fontFamily: 'AvenirNextCyr',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  sizedBoxWidth(65.w),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xFFFDE7EC),
                    child: CircleAvatar(
                      radius: 21,
                      backgroundColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          text707070_12w400("0%"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              sizedBoxHeight(9.h),
              Divider(
                thickness: 1,
                color: Color(0x66F05E90),
              ),
              sizedBoxHeight(11.h),
              Row(
                children: [
                  SvgPicture.asset("assets/svg/profileduo.svg"),
                  sizedBoxWidth(10.w),
                  Text(
                    subtext1,
                    style: TextStyle(
                      color: Color(0xFF373434),
                      fontSize: 14.sp,
                      fontFamily: 'AvenirNextCyr',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              sizedBoxHeight(4.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/moneyduo.svg"),
                          sizedBoxWidth(9.w),
                          text373434_15w400(subtext2),
                        ],
                      ),
                      sizedBoxHeight(6.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svg/heartduo.svg"),
                          sizedBoxWidth(12.w),
                          text373434_15w400("Dec 25"),
                        ],
                      ),
                    ],
                  ),
                  Container(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class Sortbottomsheet extends StatefulWidget {
  const Sortbottomsheet({super.key});

  @override
  State<Sortbottomsheet> createState() => _SortbottomsheetState();
}

class _SortbottomsheetState extends State<Sortbottomsheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textBlack16w500monsterrat("Sort by"),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset("assets/images/cancelduo.png"))
            ],
          ),
        ),
        sizedBoxHeight(11.h),
        Divider(
          thickness: 1,
          color: Color(0x77F05E90),
        ),
        sizedBoxHeight(10.h),
        Padding(
          // padding:
          padding: EdgeInsets.symmetric(horizontal: 22.w),

          // EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text373434_15w400("Nearest wedding date first"),
              sizedBoxHeight(30.h),
              text373434_15w400("Farthest wedding date first"),
              sizedBoxHeight(30.h),
              text373434_15w400("Budget high to low"),
              sizedBoxHeight(30.h),
              text373434_15w400("Budget low to high"),
              sizedBoxHeight(30.h),
              text373434_15w400("Percentage completed high to low"),
              sizedBoxHeight(30.h),
              text373434_15w400("Percentage completed low to high"),
              sizedBoxHeight(30.h),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 17.w, right: 17.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 154,
                  height: 50,
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
                        'Done',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 154,
                  height: 50,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.25, color: Color(0xFFEF2B7B)),
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
                        'Reset',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFEF2B7B),
                          fontSize: 15.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}

class Filterbottomsheet extends StatefulWidget {
  const Filterbottomsheet({super.key});

  @override
  State<Filterbottomsheet> createState() => _FilterbottomsheetState();
}

class _FilterbottomsheetState extends State<Filterbottomsheet> {
  bool allduos = false;
  bool archievedduos = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textBlack16w500monsterrat("Filter by"),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset("assets/images/cancelduo.png"))
            ],
          ),
        ),
        sizedBoxHeight(11.h),
        Divider(
          thickness: 1,
          color: Color(0x77F05E90),
        ),
        sizedBoxHeight(10.h),
        Padding(
          // padding:
          padding: EdgeInsets.symmetric(horizontal: 22.w),

          // EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text373434_15w400("All Duos"),
                  SizedBox(
                    width: 19.w,
                    height: 21.h,
                    child: Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        side:
                            BorderSide(color: Color(0xffEF2B7B), width: 1.5.w),
                        activeColor: const Color(0xffEF2B7B),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          // side: BorderSide(color: Color(0xffEF2B7B))
                        ),
                        value: allduos,
                        onChanged: (value) {
                          setState(() {
                            allduos = value ?? false;
                          });
                        }),
                  ),
                ],
              ),
              sizedBoxHeight(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text373434_15w400("Archived Duos"),
                  SizedBox(
                    width: 19.w,
                    height: 21.h,
                    child: Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        side:
                            BorderSide(color: Color(0xffEF2B7B), width: 1.5.w),
                        activeColor: const Color(0xffEF2B7B),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          // side: BorderSide(color: Color(0xffEF2B7B))
                        ),
                        value: archievedduos,
                        onChanged: (value) {
                          setState(() {
                            archievedduos = value ?? false;
                          });
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
        sizedBoxHeight(20.h),
        Padding(
          padding: EdgeInsets.only(left: 17.w, right: 17.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 154,
                  height: 50,
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
                        'Done',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 154,
                  height: 50,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.25, color: Color(0xFFEF2B7B)),
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
                        'Reset',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFEF2B7B),
                          fontSize: 15.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        sizedBoxHeight(10.h),
      ],
    ));
  }
}
