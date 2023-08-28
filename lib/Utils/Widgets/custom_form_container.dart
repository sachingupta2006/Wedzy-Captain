import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../Common/themedata.dart';

class CustomFormContainer extends StatelessWidget {
  const CustomFormContainer(
      {super.key,
      this.hintText,
      this.leadingImage,
      this.trailingImage,
      this.usingPng,
      this.txtinptype,
      this.inputFormatters,
      this.multiLines,
      this.controller,
      this.onChanged,
      this.maxLength});

  final String? leadingImage;
  final String? trailingImage;
  final TextInputType? txtinptype;
  final String? hintText;
  final bool? usingPng;
  final dynamic inputFormatters;
  final bool? multiLines;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    var activeTyping = false.obs;
    return Obx(() => Container(
          width: double.infinity,
          height: 50,
          decoration: ShapeDecoration(
            color: const Color(0xFFFEF3F8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            shadows: [
              BoxShadow(
                color: activeTyping.value
                    ? const Color(0xFFFFC1DD)
                    : AppColors.transparent,
                blurRadius: 0,
                offset: const Offset(1, 2),
              )
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  maxLength: maxLength,
                  onChanged: onChanged,
                  controller: controller,
                  onTap: () {
                    activeTyping.value = true;
                  },
                  maxLines: multiLines ?? false ? 5 : 1,
                  inputFormatters: inputFormatters,
                  keyboardType: txtinptype ?? TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    counterText: '',
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
                    hintText: hintText,
                    contentPadding: EdgeInsets.all(16.w),
                    hintStyle: const TextStyle(
                      color: Color(0xFF9B9B9B),
                      fontSize: 15,
                      fontFamily: 'AvenirNextCyr',
                      fontWeight: FontWeight.w400,
                      height: 1.60,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
