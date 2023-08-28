import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';

class StoriesIdeas extends StatelessWidget {
  const StoriesIdeas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBarDynamic(
          titleTxt: 'Stories', preferredSize: Size.fromHeight(50)),
      body: Column(
        children: [
          Image.asset(
            'assets/images/stories.png',
            width: double.infinity,
            fit: BoxFit.cover,
            // height: 186.h,
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
