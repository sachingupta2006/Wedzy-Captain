import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  List historydata = [
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
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBarDynamic(
        titleTxt: "Payment History",
        preferredSize: const Size.fromHeight(50),
        search: false,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            ListView.separated(
                itemCount: historydata.length,
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
                      history(
                          historydata[index]["image"],
                          historydata[index]["tittle"],
                          historydata[index]["subtext1"],
                          historydata[index]["subtext2"],
                          historydata[index]["ammount"])
                    ],
                  );
                })
          ],
        ),
      )),
    );
  }

  Widget history(dynamic image, dynamic tittle, dynamic subtext1,
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
        sizedBoxWidth(59.w),
        text373434_15w700(ammount)
      ],
    );
  }
}
