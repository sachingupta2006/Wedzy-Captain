import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Routes/route_name.dart';
import '../Common/sized_box.dart';

class CustomAppBarDynamic extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarDynamic(
      {Key? key,
      required this.titleTxt,
      this.col,
      this.customWidget,
      this.useCustomWidget,
      required this.preferredSize,
      this.backArrow,
      this.search,
      this.suffixWidget})
      : super(key: key);
  final String titleTxt;
  final Color? col;
  final Widget? customWidget;
  final bool? useCustomWidget;
  @override
  final Size preferredSize;
  final bool? backArrow;
  final bool? search;
  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        height: 50,
        decoration: const BoxDecoration(),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        children: [
          sizedBoxWidth(backArrow == null ? 0 : 16.w),
          Text(
            titleTxt,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.spMin,
              fontFamily: 'AvenirNextCyr',
              fontWeight: FontWeight.w700,
              color: col ?? const Color(0xFF373434),
            ),
          ),
        ],
      ),
      actions: [
        if (search == true)

          GestureDetector(
              onTap: () {
                Get.toNamed(RouteName.searchPage);
              },
              child: SvgPicture.asset('assets/svg/Search.svg'))

        else
          const SizedBox(),
        sizedBoxWidth(16.w),
        suffixWidget ?? const SizedBox()
      ],
      leading: backArrow == null
          ? IconButton(
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
            )
          : null,
      bottom: useCustomWidget ?? false
          ? PreferredSize(preferredSize: preferredSize, child: customWidget!)
          : null,
    );
  }
}
