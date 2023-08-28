import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/Common/sized_box.dart';
import '../../Utils/Widgets/common_next_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/splshLogo.svg",
                  width: 86.w, fit: BoxFit.cover),
              sizedBoxHeight(17.h),
              const Text(
                'Wedzy Business',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF373434),
                  fontSize: 22,
                  fontFamily: 'AvenirNextCyr',
                  fontWeight: FontWeight.w700,
                ),
              ),
              sizedBoxHeight(5.h),
              Text('CAPTAIN',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      color: const Color(0xFFEF2B7B),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600)),
              sizedBoxHeight(43.h),
              commonNextButton('Login', onTap: () {
                Get.toNamed("/loginScreen");
              }, margin: 16.w)
            ],
          ),
        ),
      ),
    );
  }
}
