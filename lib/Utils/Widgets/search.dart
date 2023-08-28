import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 35.h,
                width: 35.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFEF3F8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFFEF2B7B),
                ),
              ),
              iconSize: 22.spMin,
            ),
            Container(
              height: 35.h,
              width: 300.w,
              decoration: ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.15, color: Color(0xFFEF2B7B)),
                  borderRadius: BorderRadius.circular(27),
                ),
                // shadows: const [
                //   BoxShadow(
                //       color: Color(0x3F7B7B7B),
                //       blurRadius: 4,
                //       offset: Offset(1, 1))
                // ],
              ),
              child: TextFormField(
                autofocus: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(
                  fontFamily: 'AvenirNextCyr',
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(left: 9.w, top: 15.h, bottom: 15.h),
                    hintText: 'Search...',
                    hintStyle: const TextStyle(
                        color: Color(0xFF707070),
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
