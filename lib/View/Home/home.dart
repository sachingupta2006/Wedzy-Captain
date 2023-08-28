import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:wedzy_captain/Routes/route_name.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Widgets/common_next_button.dart';
import '../../Utils/Common/sized_box.dart';
import '../../Utils/Common/themedata.dart';
import 'custom_bottombar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          shadowColor: const Color(0x3FB3B3B3),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: const Icon(Icons.menu, color: AppColors.buttoncolour)),
            Row(
              children: [
                SvgPicture.asset("assets/images/splshLogo.svg",
                    width: 35.w, fit: BoxFit.cover),
                sizedBoxWidth(5.w),
                text373434_18w700('Wedzy Captain'),
              ],
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteName.notifications);
              },
              child: const Icon(Icons.notifications_outlined,
                  color: AppColors.buttoncolour),
            )
          ])),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 80.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hello, ',
                        style: TextStyle(
                          color: Color(0xFF373434),
                          fontSize: 15,
                          fontFamily: 'AvenirNextCyr',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Akanksha',
                        style: TextStyle(
                          color: Color(0xFF373434),
                          fontSize: 15,
                          fontFamily: 'AvenirNextCyr',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBoxWidth(3.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset('assets/svg/homeArrow.svg'),
                    sizedBoxHeight(5.h)
                  ],
                ),
              ],
            ),
            sizedBoxHeight(5.h),
            textEF2B2B_14w400('Let’s plan duo’s dream wedding together!'),
            sizedBoxHeight(20.h),
            Container(
              padding: EdgeInsets.only(left: 10.w, top: 10.h),
              width: double.infinity,
              decoration: ShapeDecoration(
                color: const Color(0xFFFEF7F9),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.10, color: Color(0xFFF05E90)),
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: const [
                  BoxShadow(
                      color: Color(0x3F5B5B5B),
                      blurRadius: 4,
                      offset: Offset(0, 1))
                ],
              ),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text373434_15w400(
                          'Here you can track the progress of multiple duos & explore other benefits of the app to assist you.'),
                      sizedBoxHeight(15.h),
                      SizedBox(
                          width: 160.w,
                          child: commonNextButton(
                            'Get Started !',
                            onTap: () {
                              selectedIndexBottomBar.value = 3;
                            },
                          ))
                    ],
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.r),
                      ),
                      child: SvgPicture.asset('assets/svg/homeSlope.svg'))
                ],
              ),
            ),
            sizedBoxHeight(20.h),
            text373434_18w700('Explore Ideas'),
            sizedBoxHeight(15.h),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    8,
                    (index) => Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteName.ideas);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 8.h),
                                  height: 70.w,
                                  width: 70.w,
                                  decoration: const ShapeDecoration(
                                    shape: OvalBorder(),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                        'assets/images/photo.png',
                                        fit: BoxFit.cover),
                                  ),
                                )),
                            sizedBoxWidth(15.w)
                          ],
                        )),
              ),
            ),
            sizedBoxHeight(15.h),
            text373434_18w700('Quick Access'),
            sizedBoxHeight(15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                rightBorderWidget(
                    context, 'Client Meetings', 'Client Meetings'),
                rightBorderWidget(
                  context,
                  'Vendors',
                  'vendor',
                  onTap: () {
                    selectedIndexBottomBar.value = 1;
                  },
                ),
              ],
            ),
            sizedBoxHeight(18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                rightBorderWidget(
                  context,
                  'Checklist',
                  'Checklist',
                  onTap: () {
                    selectedIndexBottomBar.value = 0;
                  },
                ),
                rightBorderWidget(
                  context,
                  'Budget',
                  'Budget',
                  onTap: () {
                    selectedIndexBottomBar.value = 3;
                  },
                ),
              ],
            ),
            sizedBoxHeight(20.h),
            text373434_18w700("Duo's Progress"),
            sizedBoxHeight(20.h),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    4,
                    (index) => Row(
                          children: [
                            leftBorderWidget(context),
                            sizedBoxWidth(12.w)
                          ],
                        )),
              ),
            ),
            sizedBoxHeight(20.h),
            text373434_18w700("Today's Tasks"),
            sizedBoxHeight(20.h),
            todaysTaskExpanded(),
            sizedBoxHeight(20.h),
            todaysTaskExpanded(),
            sizedBoxHeight(20.h),
            text373434_18w700('Real weddings Stories'),
            sizedBoxHeight(15.h),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    4,
                    (index) => Row(
                          children: [
                            realWeddingContainer(),
                            sizedBoxWidth(12.w)
                          ],
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget realWeddingContainer() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteName.realWeddings);
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 14.h),
            width: 177.w,
            height: 121.h,
            decoration: ShapeDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/wedding.png'),
                  opacity: 1.0,
                  fit: BoxFit.fill),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(13.w, 13.w, 13.w, 14.w),
            width: 177.w,
            height: 121.h,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.00, 1.00),
                end: const Alignment(0, -1),
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0)
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                textWhite18w400('Heena & Arsh'),
                textWhite12w400('21 Jun, 2023 | 4 min read'),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        color: AppColors.white, size: 12.sp),
                    sizedBoxWidth(3.w),
                    textWhite12w400('Shimla'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rightBorderWidget(context, String txt, String svg,
      {void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 30.w,
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Color(0x3F000000), blurRadius: 4),
            BoxShadow(
              color: Color(0xFFEF2B7B),
              blurRadius: 0,
              offset: Offset(2, 0),
              spreadRadius: 0,
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/svg/$svg.svg'),
            sizedBoxWidth(7.w),
            textEF2B2B_13w700(txt),
          ],
        ),
      ),
    );
  }

  Widget leftBorderWidget(context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 10.w,
      margin: EdgeInsets.only(left: 3.w, bottom: 3.w, top: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 15.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: const Color(0xFFEE3764),
              spreadRadius: 0,
              offset: Offset(-3.w, 0)),
          const BoxShadow(
              color: Color(0x3F5B5B5B), blurRadius: 4, offset: Offset(0, 1))
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/dp.png', width: 32.w),
              Container(
                padding: EdgeInsets.fromLTRB(6.w, 3.h, 8.w, 3.h),
                decoration: ShapeDecoration(
                  color: const Color(0xFFFEF3F8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite,
                        color: const Color(0xFFEF2B7B), size: 12.sp),
                    sizedBoxWidth(3.w),
                    textF05E90_12w400('Dec'),
                  ],
                ),
              )
            ],
          ),
          sizedBoxHeight(6.h),
          text373434_15w400('Virat &\nAnushka'),
          sizedBoxHeight(5.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  textF05E90_14w400('113'),
                  text373737_12w400(' Days Left')
                ],
              ),
              Column(
                children: [sizedBoxHeight(8.h), text707070_12w400('50%')],
              )
            ],
          ),
          sizedBoxHeight(6.h),
          LinearPercentIndicator(
            padding: EdgeInsets.zero,
            barRadius: const Radius.circular(100),
            percent: 0.5,
            progressColor: AppColors.buttoncolour,
            lineHeight: 4.h,
            backgroundColor: const Color(0xffFFE3F0),
          ),
        ],
      ),
    );
  }

  Widget todaysTaskExpanded() {
    var isExpanded = false.obs;
    return Obx(() => Card(
          elevation: 2,
          color: isExpanded.value
              ? const Color(0xffFFFFFF)
              : const Color(0xffFEEFF3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: ExpansionTile(
            childrenPadding: EdgeInsets.fromLTRB(11.w, 13.h, 24.w, 19.h),
            initiallyExpanded: isExpanded.value,
            onExpansionChanged: (bool expanding) {
              // setState(() {
              isExpanded.value = expanding;
              // });
            },
            trailing: Container(
              width: 20.w,
              height: 20.h,
              decoration: const ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(width: 0.50, color: Color(0xFFEE3764)),
                ),
              ),
              child: SvgPicture.asset(
                isExpanded.value
                    ? "assets/svg/arrowdown.svg"
                    : "assets/svg/rightarrow.svg",
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text373434_18w400('Virushka1234'),
                ],
              ),
            ),
            children: [
              tickTaskWidget(),
              tickTaskWidget(),
              tickTaskWidget(),
              tickTaskWidget(),
            ],
          ),
        ));
  }

  Widget tickTaskWidget() {
    var done = false.obs;
    return Obx(() => Column(
          children: [
            GestureDetector(
              onTap: () {
                done.value = !done.value;
              },
              child: Row(
                children: [
                  Container(
                    width: 20.w,
                    height: 20.w,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.75, color: Color(0xFFEE3764)),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    child: Center(
                      child: done.value
                          ? Icon(Icons.check,
                              color: AppColors.buttoncolour, size: 15.sp)
                          : const SizedBox(),
                    ),
                  ),
                  sizedBoxWidth(15.w),
                  Text(
                    'Vorem ipsum dolor sit amet',
                    style: TextStyle(
                      color: const Color(0xFF373434),
                      fontSize: 15,
                      fontFamily: 'AvenirNextCyr',
                      fontWeight: FontWeight.w400,
                      decoration: done.value
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            sizedBoxHeight(10.h)
          ],
        ));
  }
}
