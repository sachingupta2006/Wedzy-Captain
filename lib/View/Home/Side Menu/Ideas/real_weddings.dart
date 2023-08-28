import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';

import '../../../../Utils/Common/sized_box.dart';
import '../../../../Utils/Common/texts.dart';
import '../../../../Utils/Common/themedata.dart';

class RealWeddings extends StatelessWidget {
  const RealWeddings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarDynamic(
          titleTxt: 'Real Weddings', preferredSize: Size.fromHeight(50)),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 14.h),
                width: double.infinity,
                height: 234.h,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/wedding.png'),
                      opacity: 1.0,
                      fit: BoxFit.fill),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(13.w, 13.w, 13.w, 14.w),
                width: double.infinity,
                height: 234.h,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.00, 1.00),
                    end: const Alignment(0, -1),
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0)
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    textWhite18w400('Heena & Arsh'),
                    textWhite12w400('21 Jun, 2023 | 4 min read'),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: AppColors.white, size: 12.sp),
                        sizedBoxWidth(3.w),
                        textWhite12w400('Shimla'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          sizedBoxHeight(25.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: 25.r,
                        child: Image.asset('assets/images/dp.png')),
                    sizedBoxWidth(11.w),
                    Column(
                      children: [
                        Column(
                          children: [
                            text373434_15w400('Jaison Derula'),
                            text9B9B9B_15w400('10 June 2023')
                          ],
                        )
                      ],
                    )
                  ],
                ),
                sizedBoxHeight(18.h),
                text373434_18w700(
                    'Lorem ipsum dolor sit amet, elit consectetur adipiscing elit. '),
                text373434_15w400('''
     commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla velit pariatur. Excepteur sint occaecat velit cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n
     commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla velit pariatur. Excepteur sint occaecat velit cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''')
              ],
            ),
          )
        ],
      ),
    );
  }
}
