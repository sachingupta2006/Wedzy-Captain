import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedzy_captain/Routes/route_name.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';
import 'package:wedzy_captain/Utils/Widgets/common_next_button.dart';
import 'package:wedzy_captain/Utils/Widgets/dropdowntextform_field.dart';

class MehendiPage extends StatefulWidget {
  const MehendiPage({super.key});

  @override
  State<MehendiPage> createState() => _MehendiPageState();
}

class _MehendiPageState extends State<MehendiPage> {
  List mehendidata = [
    {
      "image": "assets/images/mehendi1.png",
      "subtext": "Malad , Mumbai",
      "tittle": "Prachi Mehendis ",
    },
    {
      "image": "assets/images/mehendi2.png",
      "subtext": "Borivali , Mumbai",
      "tittle": "Prachi Mehendis ",
    },
    {
      "image": "assets/images/mehendi3.png",
      "subtext": "Borivali , Mumbai",
      "tittle": "Prachi Mehendis ",
    },
    {
      "image": "assets/images/mehendi4.png",
      "subtext": "Borivali , Mumbai",
      "tittle": "Prachi Mehendis ",
    },
    {
      "image": "assets/images/mehendi5.png",
      "subtext": "Borivali , Mumbai",
      "tittle": "Prachi Mehendis ",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarDynamic(
        titleTxt: "Mehendi",
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
                    itemCount: mehendidata.length,
                    itemBuilder: (context, index) {
                      return mehendicard(
                          mehendidata[index]["image"],
                          mehendidata[index]["subtext"],
                          mehendidata[index]["tittle"]);
                    }),
              ),
            ),
            sizedBoxHeight(30.h),
          ],
        ),
      )),
    );
  }

  Widget mehendicard(dynamic image, dynamic subtext, dynamic tittle) {
    return Container(
      width: 328,
      height: 257,
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
            commonNextButton("View",onTap: () {
                    Get.toNamed(RouteName.mehendipreview);   
            },)
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
