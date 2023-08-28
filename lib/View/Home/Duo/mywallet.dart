import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';
import 'budgetpage.dart';

String formatAmountWithCommas(int value) {
  String formattedValue = value.toString();
  final length = formattedValue.length;
  final List<String> parts = [];

  for (int i = 0; i < length; i += 3) {
    final endIndex = length - i;
    final startIndex = endIndex - 3;
    parts.add(
        formattedValue.substring(startIndex < 0 ? 0 : startIndex, endIndex));
  }

  return parts.reversed.join(',');
}

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBarDynamic(
          titleTxt: 'My Wallet', preferredSize: Size.fromHeight(50)),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                color: const Color(0xFFEF2B7B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: const [
                  BoxShadow(
                      color: Color(0x3F979797),
                      blurRadius: 1,
                      offset: Offset(0, 1))
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                child: Column(
                  children: [
                    Container(
                      width: 373,
                      height: 116,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadows: const [
                          BoxShadow(
                              color: Color(0x3F979797),
                              blurRadius: 1,
                              offset: Offset(0, 1))
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.w, vertical: 9.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textBlack16w400("My Dream Wedding Budget"),
                            sizedBoxHeight(20.h),
                            textblack_25w700(
                                "₹ ${formatAmountWithCommas(totalBudget.value)}"),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textWhite16w400("Current Balance"),
                              sizedBoxHeight(1.h),
                              textWhite_18w700("₹ 0 "),
                            ],
                          ),
                          const SizedBox(
                              height: 30,
                              child: VerticalDivider(
                                  thickness: 2,
                                  width: 1,
                                  color: AppColors.white)),
                          sizedBoxWidth(10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textWhite16w400("Savings"),
                              sizedBoxHeight(1.h),
                              textWhite_18w700("₹ 3,00,000 "),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            sizedBoxHeight(30.h),
            savedAmountWidget('Reception venue & rentals', '15,0000'),
            savedAmountWidget('Ceremony Location fee', '80,000'),
            savedAmountWidget('Photographer', '20,000'),
            savedAmountWidget('Food & service', '50,000'),
            savedAmountWidget('Wedding Attire', '150,000'),
            savedAmountWidget('Reception decorations', '90,000'),
            savedAmountWidget('reception Music', '40,000'),
            savedAmountWidget('Videographer', '30,000'),
            FDottedLine(
                color: const Color(0xFFEE3764),
                width: 374,
                strokeWidth: 0.5,
                dottedLength: 4.0,
                space: 2.0),
            sizedBoxHeight(15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textBlack18w400('Total Amount'),
                textBlack18w700('₹ 17,00,000')
              ],
            ),
            sizedBoxHeight(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 12.5.h,
                  backgroundColor: const Color(0xFF0EA542),
                  child: Icon(
                    Icons.done,
                    color: AppColors.white,
                    size: 18.h,
                  ),
                ),
                sizedBoxWidth(5.w),
                textBlack16w400('You’ve saved amount of  '),
                textBlack18w700('₹ 3,00,000')
              ],
            ),
          ],
        ),
      )),
    );
  }

  Widget savedAmountWidget(String title, amount) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text373434_14w400(title),
            text373434_14w700("₹ $amount"),
          ],
        ),
        sizedBoxHeight(30.h),
      ],
    );
  }
}
