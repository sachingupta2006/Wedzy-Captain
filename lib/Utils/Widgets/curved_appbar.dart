import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'curved_appbar2.dart';

class CurveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight = 190.h;

  CurveAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
        ),
        iconSize: 22.spMin,
        color: Colors.white,
      ),
      titleSpacing: 0,
      title: textWhite18w700("Contact Us"),
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: ClipPath(
        clipper: CurvedAppBarClipper(),
        child: Container(
          height: appBarHeight,
          decoration: const BoxDecoration(
            color: Color(0xFFEE3764),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 25.h),
              Row(
                children: [
                  SizedBox(width: 13.w),
                  Expanded(
                    child: textWhite15w400(
                        "Do you have any suggestions or found some bug? Let us know"),
                  ),
                  Image.asset("assets/images/contactUs.png"),
                  SizedBox(width: 10.w)
                ],
              ),
            ],
          ),
        ),
      ),
      // Add other properties to the AppBar as needed
      // ...
    );
  }
}
