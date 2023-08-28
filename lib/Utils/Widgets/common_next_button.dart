import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget commonNextButton(String title,
    {void Function()? onTap, double? margin}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: margin ?? 0),
      width: double.infinity,
      height: 50.h,
      decoration: const ShapeDecoration(
        color: Color(0xFFEF2B7B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
            fontFamily: 'AvenirNextCyr',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}

Widget commonNextButtonReverse(String title,
    {void Function()? onTap, double? margin}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: margin ?? 0),
      width: double.infinity,
      height: 50.h,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.5, color: Color(0xFFEF2B7B)),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFFEF2B7B),
            fontSize: 15.sp,
            fontFamily: 'AvenirNextCyr',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}
