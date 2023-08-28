import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import '../../Utils/Common/sized_box.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;
  final _isWidgetVisible = false.obs;

  @override
  void initState() {
    super.initState();
    // for scaleTansition
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _scaleAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_scaleController);
    _scaleController.forward();
    // for slideTansition
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from the bottom of the screen
      end: const Offset(0, 0), // End at the initial position (center)
    ).animate(_slideController);
    Timer(const Duration(seconds: 3), () {
      _isWidgetVisible.value = true;
      _slideController.forward();
    });
    Timer(const Duration(seconds: 6), () {
      Get.offAndToNamed("/onboarding");
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: SvgPicture.asset('assets/images/splshLogo.svg'),
                ),
                sizedBoxHeight(10.h),
                Obx(() => Visibility(
                      visible: _isWidgetVisible.value,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Column(
                          children: [
                            Image.asset('assets/images/wedzy.png',
                                height: 39.h),
                            sizedBoxHeight(10.h),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Ab apki nahi, humare bhi \n',
                                    style: GoogleFonts.lato(
                                      color: const Color(0xFF1E1E1E),
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'ghar ki shaadi',
                                    style: GoogleFonts.lato(
                                      color: const Color(0xFF1E1E1E),
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' hai.',
                                    style: GoogleFonts.lato(
                                      color: const Color(0xFF1E1E1E),
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
