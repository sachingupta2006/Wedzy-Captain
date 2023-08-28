import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedzy_captain/Routes/route_name.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';
import 'package:wedzy_captain/Utils/Widgets/dropdowntextform_field.dart';

class ClothingPage extends StatefulWidget {
  const ClothingPage({super.key});

  @override
  State<ClothingPage> createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPage> {
  List clothingdata = [
    {
      "image": "assets/images/clothing1.png",
      "subtext": "Malad , Mumbai",
      "tittle": "Sakshee Lehengas",
    },
    {
      "image": "assets/images/clothing2.png",
      "subtext": "Borivali , Mumbai",
      "tittle": "Sakshee Lehengas",
    },
    {
      "image": "assets/images/clothing3.png",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarDynamic(
        titleTxt: "Clothing",
        preferredSize: const Size.fromHeight(50),
        search: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 53.w,
                  height: 33.w,
                  // height: ,
                  child: CommonDropdownBtn(
                      islocation: false,
                      hint: "City",
                      items: [
                        "Malad West, Mumbai....",
                        "Andheri West, Mumbai....",
                        "Goregaon, Mumbai....",
                        "Churchgate, Mumbai....",
                      ]),
                ),
                sizedBoxWidth(14.w),
                Container(
                  width: 57,
                  height: 35,
                  decoration: ShapeDecoration(
                    color: Color(0x21EF2B7B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Filters',
                      style: TextStyle(
                        color: Color(0xFFEE3764),
                        fontSize: 12.sp,
                        fontFamily: 'AvenirNextCyr',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
            sizedBoxHeight(13.h),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.separated(
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
                    }),
              ),
            ),
            sizedBoxHeight(30.h),
          ],
        ),
      )),
    );
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
                    Get.toNamed(RouteName.clothingpreview);
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
}
