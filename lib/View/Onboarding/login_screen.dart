import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wedzy_captain/Routes/route_name.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_next_button.dart';

import '../../Utils/Common/sized_box.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController loginotp = TextEditingController();
    bool isValidPhoneNumber(String phoneNumber) {
      final RegExp phoneNumberExpression = RegExp(r"^0{10}$");
      return !phoneNumberExpression.hasMatch(phoneNumber);
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Column(
                  children: [
                    SvgPicture.asset('assets/images/splshLogo.svg',
                        width: 81.w),
                    Image.asset("assets/images/wedzy.png", width: 81.w),
                  ],
                )),
                sizedBoxHeight(33.h),
                Text(
                  'Login to your account',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 18.spMin,
                        color: const Color(0xFF373434),
                      ),
                ),
                sizedBoxHeight(15.h),
                Container(
                  width: double.infinity,
                  height: 77.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.15, color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F999999),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enter your phone',
                              style: TextStyle(
                                color: const Color(0xFF7D7D7D),
                                fontSize: 15.spMin,
                                fontFamily: 'AvenirNextCyr',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            sizedBoxHeight(10.h),
                            SizedBox(
                              height: 25.h,
                              width: 160.w,
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]')),
                                ],
                                cursorColor: const Color(0xFFC3C3C3),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFC3C3C3),
                                    ),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFC3C3C3),
                                    ),
                                  ),
                                  icon: Text(
                                    '+91',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.spMin,
                                      fontFamily: 'AvenirNextCyr',
                                      fontWeight: FontWeight.w400,
                                      // letterSpacing: 0.15,
                                    ),
                                  ),
                                ),
                                onSaved: (String? value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "Empty value";
                                  } else if (value.length != 10) {
                                    return "Please Enter Valid Phone Number";
                                  } else if (!isValidPhoneNumber(value)) {
                                    return 'Phone number cannot contain 10 zeros';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.snackbar("Successful", "OTP Sent");
                          },
                          child: Container(
                            width: 109,
                            height: 40,
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
                                'Send OTP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontFamily: 'AvenirNextCyr',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.15,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                sizedBoxHeight(50.h),
                Text(
                  'Enter 4 digit OTP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'AvenirNextCyr',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.18,
                  ),
                ),
                sizedBoxHeight(30.h),
                PinCodeTextField(
                  showCursor: true,
                  cursorColor: const Color(0xFF143C6D),
                  textStyle: TextStyle(
                      fontSize: 18.sp, color: const Color(0xFF143C6D)),
                  errorTextSpace: 22,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Please Enter verification code";
                    } else if (value != null && value.length < 4) {
                      return "OTP length should be atleast 4";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    inactiveColor: const Color(0xFFCCCCCC),
                    activeColor: const Color(0xFFCCCCCC),
                    selectedColor: const Color(0xFFCCCCCC),
                    shape: PinCodeFieldShape.box,
                    borderWidth: 0.10,
                    borderRadius: BorderRadius.circular(5),
                    activeBoxShadow: [
                      const BoxShadow(
                        color: Color(0x3F4C4C4C),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                    inActiveBoxShadow: [
                      const BoxShadow(
                        color: Color(0x3F4C4C4C),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                    fieldHeight: 60.h,
                    fieldWidth: 52.w,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: loginotp,
                  onCompleted: (v) {},
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
                sizedBoxHeight(40.h),
                commonNextButton(
                  "Next",
                  onTap: () {
                    Get.toNamed(RouteName.customBottomBar);
                    // Get.to(() => const TempororyHomeRoute());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
