import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedzy_captain/Routes/route_name.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';

class ManagePayments extends StatefulWidget {
  const ManagePayments({super.key});

  @override
  State<ManagePayments> createState() => _ManagePaymentsState();
}

class _ManagePaymentsState extends State<ManagePayments> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBarDynamic(
          titleTxt: "Payments",
          preferredSize: const Size.fromHeight(90),
          search: false,
          useCustomWidget: true,
          suffixWidget: Padding(
            padding: EdgeInsets.only(right: 18.w),
            child: InkWell(
              onTap: () {
                    Get.toNamed(RouteName.paymenthistory);
                
              },
              child: SvgPicture.asset("assets/svg/history.svg")),
          ),
          customWidget: Stack(
            children: [
              TabBar(
                  indicatorColor: AppColors.buttoncolour,
                  indicatorWeight: 2.5.h,
                  labelPadding: EdgeInsets.only(bottom: 12.h),
                  tabs: [
                    text373434_15w400("Advance"),
                    text373434_15w400("Pending")
                  ]),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: -8.h,
                  child: Divider(
                    thickness: 0.25,
                    color: AppColors.buttoncolour,
                  ))
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: TabBarView(children: [
            Advance(),
            Pending(),
          ]),
        ),
      ),
    );
  }
}

class Advance extends StatefulWidget {
  const Advance({super.key});

  @override
  State<Advance> createState() => _AdvanceState();
}

class _AdvanceState extends State<Advance> {
  List advancedata = [
    {
      "image": "assets/images/payment1.png",
      "tittle": "Reethik  Jewellers",
      "subtext1": "Apr 20 , 2023 ",
      "subtext2": "09:12",
      "ammount": " ₹ 20,000",
    },
    {
      "image": "assets/images/payment1.png",
      "tittle": "Reethik  Jewellers",
      "subtext1": "Apr 20 , 2023 ",
      "subtext2": "09:12",
      "ammount": " ₹ 20,000",
    },
    {
      "image": "assets/images/payment1.png",
      "tittle": "Reethik  Jewellers",
      "subtext1": "Apr 20 , 2023 ",
      "subtext2": "09:12",
      "ammount": " ₹ 20,000",
    },
    {
      "image": "assets/images/payment1.png",
      "tittle": "Reethik  Jewellers",
      "subtext1": "Apr 20 , 2023 ",
      "subtext2": "09:12",
      "ammount": " ₹ 20,000",
    },
    {
      "image": "assets/images/payment1.png",
      "tittle": "Reethik  Jewellers",
      "subtext1": "Apr 20 , 2023 ",
      "subtext2": "09:12",
      "ammount": " ₹ 20,000",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
              itemCount: advancedata.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 5.h,
                );
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    sizedBoxHeight(30.h),
                    advance(
                        advancedata[index]["image"],
                        advancedata[index]["tittle"],
                        advancedata[index]["subtext1"],
                        advancedata[index]["subtext2"],
                        advancedata[index]["ammount"])
                  ],
                );
              })
        ],
      ),
    );
  }

  Widget advance(dynamic image, dynamic tittle, dynamic subtext1,
      dynamic subtext2, dynamic ammount) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage(image),
          //  Image.asset(image),
        ),
        sizedBoxWidth(8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text373434_18w400(tittle),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                text707070_12w400(subtext1),
                sizedBoxWidth(9.w),
                SvgPicture.asset("assets/images/Ellipse 1325.svg"),
                sizedBoxWidth(7.w),
                text707070_12w400(subtext2),
              ],
            ),
          ],
        ),
        sizedBoxWidth(31.w),
        SvgPicture.asset(
          "assets/svg/managepaygreen.svg",
          width: 20.w,
          height: 20.h,
        ),
        sizedBoxWidth(8.w),
        text373434_15w700(ammount)
      ],
    );
  }
}

class Pending extends StatefulWidget {
  const Pending({super.key});

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  List pendingdata = [
    {
      "image": "assets/images/payment1.png",
      "tittle": "Reethik  Jewellers",
      "subtext1": "Apr 20 , 2023 ",
      "subtext2": "09:12",
      "ammount": " ₹ 20,000",
    },
    {
      "image": "assets/images/payment1.png",
      "tittle": "Reethik  Jewellers",
      "subtext1": "Apr 20 , 2023 ",
      "subtext2": "09:12",
      "ammount": " ₹ 20,000",
    },
    {
      "image": "assets/images/payment1.png",
      "tittle": "Reethik  Jewellers",
      "subtext1": "Apr 20 , 2023 ",
      "subtext2": "09:12",
      "ammount": " ₹ 20,000",
    },
    {
      "image": "assets/images/payment1.png",
      "tittle": "Reethik  Jewellers",
      "subtext1": "Apr 20 , 2023 ",
      "subtext2": "09:12",
      "ammount": " ₹ 20,000",
    },
    {
      "image": "assets/images/payment1.png",
      "tittle": "Reethik  Jewellers",
      "subtext1": "Apr 20 , 2023 ",
      "subtext2": "09:12",
      "ammount": " ₹ 20,000",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
              itemCount: pendingdata.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 5.h,
                );
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    sizedBoxHeight(30.h),
                    pending(
                        pendingdata[index]["image"],
                        pendingdata[index]["tittle"],
                        pendingdata[index]["subtext1"],
                        pendingdata[index]["subtext2"],
                        pendingdata[index]["ammount"])
                  ],
                );
              })
        ],
      ),
    );
  }

  Widget pending(dynamic image, dynamic tittle, dynamic subtext1,
      dynamic subtext2, dynamic ammount) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage(image),
          //  Image.asset(image),
        ),
        sizedBoxWidth(8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text373434_18w400(tittle),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                text707070_12w400(subtext1),
                sizedBoxWidth(9.w),
                SvgPicture.asset("assets/images/Ellipse 1325.svg"),
                sizedBoxWidth(7.w),
                text707070_12w400(subtext2),
              ],
            ),
          ],
        ),
        sizedBoxWidth(31.w),
        SvgPicture.asset(
          "assets/svg/managepayred.svg",
          width: 20.w,
          height: 20.h,
        ),
        sizedBoxWidth(8.w),
        text373434_15w700(ammount)
      ],
    );
  }
}
