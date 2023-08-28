import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wedzy_captain/Utils/Widgets/common_next_button.dart';
import '../../../Utils/Common/sized_box.dart';
import '../../../Utils/Common/texts.dart';
import '../../../Utils/Widgets/curved_appbar2.dart';
import '../../../Utils/Widgets/custom_form_container.dart';

class Feedback extends StatelessWidget {
  const Feedback({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt currentSliderValue = 50.obs;
    List labelText = ['Very Bad', 'Poor', 'Neutral', 'Good', 'Excellent'];
    List svg = ['verybadMood', 'Poor', 'neutral', 'goodMood', 'ExcellentMood'];

    return Scaffold(
      appBar: CurveAppBar2(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 31.h),
              text373434_15w400('How was your experience?'),
              SizedBox(height: 23.h),
              Obx(
                () => Column(
                  children: [
                    SvgPicture.asset(
                        "assets/svg/${svg[currentSliderValue.value == 0 ? 0 : currentSliderValue.value == 25 ? 1 : currentSliderValue.value == 50 ? 2 : currentSliderValue.value == 75 ? 3 : 4]}.svg"),
                    SizedBox(height: 38.h),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: const Color(0xFFEE3764),
                        activeTrackColor: const Color(0xFFEE3764),
                        inactiveTrackColor: const Color(0xFFFFC1DD),
                        activeTickMarkColor: const Color(0xFFEE3764),
                        inactiveTickMarkColor: const Color(0xFFFFC1DD),
                        tickMarkShape:
                            const RoundSliderTickMarkShape(tickMarkRadius: 5),
                        valueIndicatorColor: const Color(
                            0xFFEE3764), // Customize value indicator color
                        valueIndicatorTextStyle: const TextStyle(
                            color: Colors
                                .white), // Customize value indicator text color
                      ),
                      child: Slider(
                        value: currentSliderValue.value.toDouble(),
                        max: 100,
                        divisions: 4,
                        label: labelText[currentSliderValue.value == 0
                            ? 0
                            : currentSliderValue.value == 25
                                ? 1
                                : currentSliderValue.value == 50
                                    ? 2
                                    : currentSliderValue.value == 75
                                        ? 3
                                        : 4],
                        onChanged: (double value) {
                          currentSliderValue.value = value.toInt();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 128.h,
                child: const CustomFormContainer(
                  multiLines: true,
                  hintText: "Write your experience here...",
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  SvgPicture.asset("assets/svg/paperclip.svg"),
                  const SizedBox(width: 5),
                  const Text(
                    'Upload your attachment',
                    style: TextStyle(
                      color: Color(0xFFEE3764),
                      fontSize: 15,
                      fontFamily: 'Avenir Next Cyr',
                      fontWeight: FontWeight.w400,
                      height: 1.60,
                      letterSpacing: 0.15,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
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
                            text373434_15w400('Thank You !'),
                            sizedBoxHeight(10.h),
                            text373434_15w400Center(
                                'Your Feedback Has Been Sent To The Admin'),
                            sizedBoxHeight(14.h),
                            SizedBox(
                                width: 192.w,
                                child: commonNextButton(
                                  'Back',
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
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
