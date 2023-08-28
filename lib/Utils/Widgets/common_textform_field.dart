import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextformfield extends StatelessWidget {
  const CustomTextformfield(
      {super.key,
      this.hintText,
      this.leadingImage,
      this.trailingImage,
      this.usingPng});

  final String? leadingImage;
  final String? trailingImage;
  final String? hintText;
  final bool? usingPng;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: const Color(0xFFFEF3F8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        shadows: const [
          BoxShadow(color: Color(0xFFFFC1DD), offset: Offset(1, 2))
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: TextStyle(
                fontFamily: 'AvenirNextCyr',
                fontSize: 16.sp,
                color: Colors.black,
              ),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  prefixIcon: leadingImage != null
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 14, top: 15, bottom: 15),
                          child: usingPng ?? false
                              ? Image.asset(leadingImage!)
                              : SvgPicture.asset(
                                  leadingImage!, // Replace with your SVG icon path
                                ),
                        )
                      : null,
                  suffixIcon: trailingImage != null
                      ? Padding(
                          padding: const EdgeInsets.only(
                              right: 19, top: 15, bottom: 15),
                          child: SvgPicture.asset(
                              trailingImage! // Replace with your SVG icon path
                              ),
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 9.w, top: 15.h, bottom: 15.h),
                  hintText: hintText,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(
                          color: const Color(0xFF9F9F9F),
                          fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }
}
