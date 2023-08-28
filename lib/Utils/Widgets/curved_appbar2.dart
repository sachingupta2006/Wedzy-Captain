import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurveAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight = 200.h;

  CurveAppBar2({super.key});

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
      title: const Text(
        "Feedback",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Avenir Next Cyr',
          fontWeight: FontWeight.w700,
          height: 1.50,
          letterSpacing: 0.18,
        ),
      ),
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
              SizedBox(
                height: 50.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 13.w,
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Send us your feedback',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Avenir Next Cyr',
                            fontWeight: FontWeight.w400,
                            height: 1.50,
                            letterSpacing: 0.18,
                          ),
                        ),
                        Text(
                          'Do you have any suggestions or found some bug? Let us know',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Avenir Next Cyr',
                            fontWeight: FontWeight.w400,
                            height: 1.60,
                            letterSpacing: 0.15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/feedback.png",
                    height: 150.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  )
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

class CurvedAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const double radius = 29.0;

    path.moveTo(0, 0);
    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(0, size.height, radius, size.height);
    path.lineTo(size.width - radius, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - radius);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
