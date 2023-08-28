import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';

class Clothingpreview extends StatefulWidget {
  const Clothingpreview({super.key});

  @override
  State<Clothingpreview> createState() => _ClothingpreviewState();
}

class _ClothingpreviewState extends State<Clothingpreview> {
  bool showingAdditionalDetails = false;
  final ScrollController scrollController = ScrollController();
  final RxInt sliderPage = 0.obs;
  // CalendarController  = CalendarController();
  CalendarController _calendarController = CalendarController();

  List images = [
    {
      "image": "assets/images/clothing6.png",
    },
    {
      "image": "assets/images/clothing7.png",
    },
    {
      "image": "assets/images/clothing6.png",
    },
    {
      "image": "assets/images/clothing7.png",
    },
    {
      "image": "assets/images/clothing6.png",
    },
  ];

  List clothingdata = [
    {
      "image": "assets/images/clothing2.png",
      "subtext": "Borivali , Mumbai",
      "tittle": "Sakshee Lehengas",
    },
    {
      "image": "assets/images/clothing4.png",
      "subtext": "Borivali , Mumbai",
      "tittle": "Sakshee Lehengas",
    },
    {
      "image": "assets/images/clothing5.png",
      "subtext": "Borivali , Mumbai",
      "tittle": "Sakshee Lehengas",
    },
  ];

  SfCalendar _getAppointmentEditorCalendar(
      [CalendarController? calendarController,
      CalendarDataSource? calendarDataSource,
      dynamic calendarTapCallback,
      ViewChangedCallback? viewChangedCallback,
      dynamic scheduleViewBuilder]) {
    return SfCalendar(
      view: CalendarView.month,
      firstDayOfWeek: 1,
      cellBorderColor: AppColors.white,
      todayHighlightColor: AppColors.buttoncolour,
      todayTextStyle: const TextStyle(color: AppColors.white),
      controller: _calendarController,
      showNavigationArrow: true,
      allowViewNavigation: true,
      monthViewSettings: const MonthViewSettings(),
      timeSlotViewSettings: const TimeSlotViewSettings(
          minimumAppointmentDuration: Duration(minutes: 60)),
    );
  }

  buildcalendardialog(context) {
    return showDialog(
      context: context,
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 360,
            height: 394,
            child: AlertDialog(
                // insetPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                contentPadding: EdgeInsets.fromLTRB(4, 10, 4, 0),
                backgroundColor:
                    Get.isDarkMode ? Colors.black : Color(0XFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(
                      color: Get.isDarkMode ? Colors.grey : Color(0XFFFFFFFF)),
                ),
                content: Column(
                  children: [
                    _getAppointmentEditorCalendar(
                      _calendarController,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.buttoncolour,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: AppColors.buttoncolour,
                ),
              ),
            ),
            child: child!);
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      int index = (scrollController.offset / 170.w).round();
      sliderPage.value = index;
      // _calendarController = CalendarController();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarDynamic(
        titleTxt: "Clothing",
        preferredSize: const Size.fromHeight(50),
        suffixWidget: Padding(
          padding: EdgeInsets.only(right: 17.w),
          child: SvgPicture.asset("assets/images/search.svg"),
        ),
      ),
      body: SafeArea(
          child: Column(children: [
        Expanded(
          child: Stack(children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 388,
                    height: 200,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/clothing8.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 18.w, top: 17.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                bookmarkCircle(),
                              ],
                            ),
                          ),
                          SvgPicture.asset("assets/svg/dotindicator.svg")
                        ],
                      ),
                    ),
                  ),
                  sizedBoxHeight(14.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(-0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: [Color(0xFFEF2B7B), Color(0x00D9D9D9)],
                          ),
                          shape: OvalBorder(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'SL',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      sizedBoxWidth(4.w),
                      textBlack16w500("Sakshee Lehengas"),
                      sizedBoxWidth(82.w),
                      SvgPicture.asset(
                        "assets/svg/Star 1.svg",
                        width: 27.w,
                        height: 27.h,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '4.8 (',
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 16.sp,
                                fontFamily: 'AvenirNextCyr',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: '67',
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                                fontSize: 16.sp,
                                fontFamily: 'AvenirNextCyr',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ')',
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 16.sp,
                                fontFamily: 'AvenirNextCyr',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  sizedBoxHeight(15.h),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/location.svg",
                          width: 22.w,
                          height: 22.h,
                        ),
                        sizedBoxWidth(12.w),
                        Text(
                          'Malad west ,Mumbai',
                          style: TextStyle(
                            color: Color(0xFF373434),
                            fontSize: 16.sp,
                            fontFamily: 'AvenirNextCyr',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  sizedBoxHeight(12.h),
                  Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/mail (3).svg",
                          width: 21.w,
                          height: 21.h,
                        ),
                        sizedBoxWidth(10.w),
                        Text(
                          'goldenleaf@gmail.com',
                          style: TextStyle(
                            color: Color(0xFF373434),
                            fontSize: 16.sp,
                            fontFamily: 'AvenirNextCyr',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  sizedBoxHeight(18.h),
                  Container(
                    width: 328.w,
                    // height: 91.h,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x68EE3764),
                            spreadRadius: 0,
                            offset: Offset(-3.w, 0)),
                        const BoxShadow(
                            color: Color(0x3F5B5B5B),
                            blurRadius: 4,
                            offset: Offset(0, 1))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        // left: 14.w,
                        top: 19.h,
                        // right: 18.w,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 14.w, right: 14.w, bottom: 10.h),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pricing Info',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF373434),
                                fontSize: 18.sp,
                                fontFamily: 'AvenirNextCyr',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            sizedBoxWidth(112.w),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '₹',
                                    style: TextStyle(
                                      color: Color(0xFFEF2B7B),
                                      fontSize: 18.sp,
                                      fontFamily: 'AvenirNextCyr',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' 1,00,000',
                                    style: TextStyle(
                                      color: Color(0xFF373434),
                                      fontSize: 18.sp,
                                      fontFamily: 'AvenirNextCyr',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            sizedBoxHeight(18.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                  sizedBoxHeight(20.h),
                  Text(
                    'About',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF373434),
                      fontSize: 18.sp,
                      fontFamily: 'AvenirNextCyr',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  sizedBoxHeight(8.h),
                  text373434_15w400("5 years of experience working since 2018"),
                  sizedBoxHeight(8.h),
                  text373434_15w400(
                      "Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et dolor sit amet Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et dolor sit amet"),
                  sizedBoxHeight(11.h),
                  text373434_15w400("Cancellation Policy"),
                  sizedBoxHeight(1.h),
                  text373434_15w400("Lorem ipsum dolor sit amet"),
                  sizedBoxHeight(10.h),
                  text373434_15w400("Exchange policy"),
                  sizedBoxHeight(1.h),
                  text373434_15w400("Lorem ipsum dolor sit amet"),
                  sizedBoxHeight(9.h),
                  text373434_15w400("Refind policy"),
                  sizedBoxHeight(1.h),
                  text373434_15w400("Lorem ipsum dolor sit amet"),
                  sizedBoxHeight(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'View more',
                        style: TextStyle(
                          color: Color(0xFFEF2B7B),
                          fontSize: 15.sp,
                          fontFamily: 'AvenirNextCyr',
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  sizedBoxHeight(9.h),
                  Container(
                    width: 328.w,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.25,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0x77F05E90),
                        ),
                      ),
                    ),
                  ),
                  sizedBoxHeight(12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' Album',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF373434),
                          fontSize: 18.sp,
                          fontFamily: 'AvenirNextCyr',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        width: 83.w,
                        height: 29.h,
                        decoration: ShapeDecoration(
                          color: Color(0x21EF2B7B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'View more',
                              style: TextStyle(
                                color: Color(0xFFEF2B7B),
                                fontSize: 12.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  sizedBoxHeight(35.h),
                  SizedBox(
                    height: 164.h,
                    // width: 155.w,
                    child: ListView.separated(
                      itemCount: images.length,
                      controller: scrollController,
                      separatorBuilder: (_, index) {
                        return sizedBoxWidth(1.w);
                      },
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Container(
                            width: 155.w,
                            height: 124.h,
                            decoration: ShapeDecoration(
                              // color: Colors.yellow,
                              image: DecorationImage(
                                image: AssetImage(
                                  images[index]['image'],
                                ),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 8.w, right: 3.w, top: 9.h, bottom: 7.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 92.w,
                                    height: 28.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.white
                                          .withOpacity(0.6299999952316284),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Portfolio',
                                          style: TextStyle(
                                            color: Color(0xFF373434),
                                            fontSize: 15.sp,
                                            fontFamily: 'AvenirNextCyr',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  sizedBoxHeight(86.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 46.w,
                                        height: 28.h,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFFEF3F8),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 3.w,
                                              top: 3.h,
                                              right: 3.w,
                                              bottom: 3.h),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/svg/gallery.svg"),
                                              Text(
                                                '10',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFFEE3764),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  sizedBoxHeight(19.h),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        images.length,
                        (index) => Container(
                          decoration: BoxDecoration(
                              color: AppColors.buttoncolour,
                              borderRadius: BorderRadius.circular(25.r)),
                          width: 6.w,
                          height: sliderPage.value == index ? 6.h : 4.h,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  sizedBoxHeight(18.h),
                  Container(
                    width: 328.w,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.25,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0x77F05E90),
                        ),
                      ),
                    ),
                  ),
                  sizedBoxHeight(9.h),
                  Text(
                    'Reviews',
                    style: TextStyle(
                      color: Color(0xFF373434),
                      fontSize: 18.sp,
                      fontFamily: 'AvenirNextCyr',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  sizedBoxHeight(11.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/Star 1.svg",
                        width: 27.w,
                        height: 27.h,
                      ),
                      sizedBoxWidth(6.w),
                      Text(
                        '5 Review Score',
                        style: TextStyle(
                          color: Color(0xFF373434),
                          fontSize: 15.sp,
                          fontFamily: 'AvenirNextCyr',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      sizedBoxWidth(12.w),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '(',
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 12.sp,
                                fontFamily: 'AvenirNextCyr',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: '12 Reviews',
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                                fontSize: 12.sp,
                                fontFamily: 'AvenirNextCyr',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ')',
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontSize: 12.sp,
                                fontFamily: 'AvenirNextCyr',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  sizedBoxHeight(9.h),
                  FDottedLine(
                    color: const Color(0xFFEE3764),
                    width: 374,
                    strokeWidth: 0.5,
                    dottedLength: 4.0,
                    space: 2.0,
                  ),
                  sizedBoxHeight(16.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/previewimage.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                      sizedBoxWidth(4.w),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text373434_15w400("Namrata Burondkar"),
                          // sizedBoxHeight(9.w),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/svg/Star 1.svg",
                                // width: 27.w,
                                // height: 27.h,
                              ),
                              sizedBoxWidth(6.w),
                              text373434_15w400("5")
                            ],
                          )
                        ],
                      ),
                      sizedBoxWidth(51.w),
                      text373434_15w400("4 Months Ago")
                    ],
                  ),
                  sizedBoxHeight(4.h),
                  text373434_15w400(
                      "Yorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."),
                  sizedBoxHeight(19.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'View more',
                        style: TextStyle(
                          color: Color(0xFFEF2B7B),
                          fontSize: 15.sp,
                          fontFamily: 'AvenirNextCyr',
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  sizedBoxHeight(9.h),
                  Container(
                    width: 338.w,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.25,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0x77F05E90),
                        ),
                      ),
                    ),
                  ),
                  sizedBoxHeight(11.h),
                  Text(
                    'Browse similar vendors',
                    style: TextStyle(
                      color: Color(0xFF373434),
                      fontSize: 16.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  sizedBoxHeight(5.h),
                  ListView.separated(
                    separatorBuilder: (context, index) {
                      return sizedBoxHeight(22.h);
                    },
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: clothingdata.length,
                    itemBuilder: (context, index) {
                      return clothingcard(
                          clothingdata[index]["image"],
                          clothingdata[index]["subtext"],
                          clothingdata[index]["tittle"]);
                    },
                  ),
                  sizedBoxHeight(70.h),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 380,
                  height: 68,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0x3F5B5B5B),
                            blurRadius: 4,
                            offset: Offset(0, 1))
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(left: 14.w, top: 8.h, bottom: 8.h),
                    child: Row(
                      children: [
                        Container(
                          width: 54,
                          height: 51,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/previewimage2.png"),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                          ),
                        ),
                        sizedBoxWidth(10.w),
                        textBlack16w500("Reethik"),
                        sizedBoxWidth(62.w),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => _presentDatePicker(),
                              // onTap: () {
                              //   buildcalendardialog(context);
                              // },
                              child: CircleAvatar(
                                radius: 17,
                                backgroundColor: AppColors.buttoncolour,
                                child: CircleAvatar(
                                  radius: 13.w,
                                  backgroundColor: Colors.white,
                                  child: SvgPicture.asset(
                                    "assets/svg/calendar-[#1196].svg",
                                    // width: 5.w,
                                    // height: 5.h,
                                  ),
                                ),
                              ),
                            ),
                            sizedBoxWidth(12.w),
                            CircleAvatar(
                              radius: 17,
                              backgroundColor: AppColors.buttoncolour,
                              child: CircleAvatar(
                                radius: 13.w,
                                backgroundColor: Colors.white,
                                child: SvgPicture.asset(
                                  "assets/svg/call.svg",
                                  // width: 5.w,
                                  // height: 5.h,
                                ),
                              ),
                            ),
                            sizedBoxWidth(12.w),
                            CircleAvatar(
                              radius: 17,
                              backgroundColor: AppColors.buttoncolour,
                              child: CircleAvatar(
                                radius: 13.w,
                                backgroundColor: Colors.white,
                                child: SvgPicture.asset(
                                  "assets/svg/message.svg",
                                  // width: 5.w,
                                  // height: 5.h,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ])),
    );
  }

  Widget bookmarkCircle() {
    var bookmark = false.obs;

    return Obx(() => GestureDetector(
          onTap: () {
            bookmark.value = !bookmark.value;
          },
          child: CircleAvatar(
              radius: 16.r,
              backgroundColor: AppColors.white,
              child: bookmark.value
                  ? Icon(Icons.bookmark,
                      color: AppColors.buttoncolour, size: 18.h)
                  : SvgPicture.asset('assets/svg/bookmark.svg', height: 18.h)),
        ));
  }

  Widget clothingcard(dynamic image, dynamic subtext, dynamic tittle) {
    return Container(
      width: 328,
      height: 277,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: Color(0x49EF2B7B)),
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3FAAAAAA),
            blurRadius: 4,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 13.w, right: 15.w, top: 14.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 350,
              height: 125,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 11.w, top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    bookmarkCircle(),
                  ],
                ),
              ),
            ),
            sizedBoxHeight(5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subtext,
                  style: TextStyle(
                    color: Color(0xFF707070),
                    fontSize: 12.sp,
                    fontFamily: 'AvenirNextCyr',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/Star 1.svg"),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '4.8 (',
                            style: TextStyle(
                              color: Color(0xFF707070),
                              fontSize: 12.sp,
                              fontFamily: 'AvenirNextCyr',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: '67',
                            style: TextStyle(
                              color: Color(0xFF9B9B9B),
                              fontSize: 12.sp,
                              fontFamily: 'AvenirNextCyr',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ')',
                            style: TextStyle(
                              color: Color(0xFF707070),
                              fontSize: 12.sp,
                              fontFamily: 'AvenirNextCyr',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            sizedBoxHeight(1.h),
            Text(
              tittle,
              style: TextStyle(
                color: Color(0xFF373434),
                fontSize: 18.sp,
                fontFamily: 'AvenirNextCyr',
                fontWeight: FontWeight.w500,
              ),
            ),
            sizedBoxHeight(14.h),
            Divider(
              thickness: 1,
              color: AppColors.buttoncolour,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text373737_12w400("Lehenga price"),
                    text373434_18w700("₹ 1,00,000")
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(RouteName.clothingpreview);
                  },
                  child: Container(
                    width: 95,
                    height: 34,
                    decoration: ShapeDecoration(
                      color: Color(0xFFEF2B7B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'View',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontFamily: 'AvenirNextCyr',
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
