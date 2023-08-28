import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedzy_captain/Utils/Widgets/common_next_button.dart';
import '../../../Utils/Common/sized_box.dart';
import '../../../Utils/Common/texts.dart';
import '../../../Utils/Widgets/curved_appbar.dart';
import '../../../Utils/Widgets/custom_form_container.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CurveAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 38.h),
              text373434_15w400("Name"),
              SizedBox(height: 10.h),
              const CustomFormContainer(hintText: "Enter Name"),
              SizedBox(height: 25.h),
              text373434_15w400("Email"),
              SizedBox(height: 7.h),
              const CustomFormContainer(
                hintText: "Enter Email",
              ),
              SizedBox(height: 25.h),
              text373434_15w400("Message"),
              SizedBox(height: 7.h),
              SizedBox(
                height: 87.h,
                child: const CustomFormContainer(
                  multiLines: true,
                  hintText: "Enter Message",
                ),
              ),
              SizedBox(
                height: 117.h,
              ),
              commonNextButton(
                "Save",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                                'assets/images/SVG/requestSend.svg'),
                            text373434_18w400('Thank You !'),
                            sizedBoxHeight(10.h),
                            text373434_15w400Center(
                                'Your message has been sent to the admin. Kindly wait for the review.'),
                            sizedBoxHeight(14.h),
                            SizedBox(
                                width: 192.w,
                                child: commonNextButton(
                                  'Back',
                                  onTap: () {
                                    Get.back();
                                    Get.back();
                                  },
                                ))
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: 50.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
