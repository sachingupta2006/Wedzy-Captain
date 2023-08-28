import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wedzy_captain/Routes/route_name.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';

class Ideas extends StatelessWidget {
  const Ideas({super.key});

  @override
  Widget build(BuildContext context) {
    var bookmark = false.obs;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBarDynamic(
          suffixWidget: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Obx(
                () => GestureDetector(
                    onTap: () {
                      bookmark.value = !bookmark.value;
                    },
                    child: bookmark.value
                        ? Icon(
                            Icons.bookmark,
                            color: AppColors.buttoncolour,
                            size: 28.h,
                          )
                        : SvgPicture.asset('assets/svg/bookmark.svg')),
              )),
          search: true,
          titleTxt: 'Ideas',
          preferredSize: const Size.fromHeight(50)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text373434_18w700('Top Suggestions'),
            sizedBoxHeight(15.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  topSuggestions(),
                  topSuggestions(),
                  topSuggestions(),
                  topSuggestions(),
                  topSuggestions(),
                  topSuggestions(),
                  topSuggestions(),
                ],
              ),
            ),
            sizedBoxHeight(17.h),
            DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: <Widget>[
                    ButtonsTabBar(
                      buttonMargin: EdgeInsets.symmetric(horizontal: 4.w),
                      contentPadding: EdgeInsets.symmetric(horizontal: 19.w),
                      radius: 25,
                      backgroundColor: const Color(0xFFEF2B7B),
                      unselectedBorderColor: const Color(0xFFF4F4F4),
                      unselectedBackgroundColor: AppColors.white,
                      unselectedLabelStyle:
                          const TextStyle(color: Color(0xFF373434)),
                      labelStyle: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp,
                      ),
                      tabs: const [
                        Tab(text: "Photos"),
                        Tab(text: "Stories"),
                        Tab(text: "Real Weddings"),
                      ],
                    ),
                    sizedBoxHeight(18.h),
                    Divider(color: AppColors.buttoncolour, thickness: 0.25.h),
                    SizedBox(
                      height: 620.h,
                      child: TabBarView(children: [
                        firstTab(),
                        secondTab(),
                        thirdTab(),
                      ]),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget firstTab() {
    return GridView.builder(
      padding: EdgeInsets.only(right: 14.w),
      physics: const BouncingScrollPhysics(),
      itemCount: 15,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Image.asset(
              'assets/images/photo.png',
              fit: BoxFit.fill,
            ),
            Positioned(top: 16.h, right: 16.w, child: bookmarkCircle())
          ],
        );
      },
    );
  }

  Widget secondTab() {
    return GridView.builder(
      padding: EdgeInsets.only(right: 14.w),
      physics: const BouncingScrollPhysics(),
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 1.55.h, mainAxisSpacing: 13.h),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(RouteName.storiesIdeas);
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(13.w, 13.w, 13.w, 0),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.25, color: Color(0x49EF2B7B)),
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3FAAAAAA),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/stories.png',
                        width: double.infinity,
                        height: 125.h,
                        fit: BoxFit.fill),
                    Positioned(top: 16.h, right: 16.w, child: bookmarkCircle())
                  ],
                ),
                sizedBoxHeight(9.h),
                text373434_15w700(
                    '''#Trending - Thick Floral Braids for Mehndi & Haldi'''),
                Divider(
                  height: 18.h,
                  color: AppColors.buttoncolour,
                  thickness: 0.25.h,
                ),
                text707070_12w400('21 Jun, 2023 | 4 min read')
              ],
            ),
          ),
        );
      },
    );
  }

  Widget thirdTab() {
    return ListView.builder(
      padding: EdgeInsets.only(right: 16.w),
      physics: const BouncingScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(RouteName.realWeddings);
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 14.h),
                    width: double.infinity,
                    height: 234.h,
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
                    width: double.infinity,
                    height: 234.h,
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
                  Positioned(top: 16.h, right: 16.w, child: bookmarkCircle())
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget topSuggestions() {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 7.w, right: 7.w, bottom: 36.h),
              width: 124,
              height: 182,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/images/topSuggestions.png'),
                    opacity: 1),
                // gradient: LinearGradient(
                //   begin: const Alignment(0.00, 1.00),
                //   end: const Alignment(0, -1),
                //   colors: [Colors.black, Colors.black.withOpacity(0)],
                // ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [textWhite15w700('Haldi Outfits')],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 7.w, right: 7.w, bottom: 36.h),
              width: 124,
              height: 182,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.00, 1.00),
                  end: const Alignment(0, -1),
                  colors: [Colors.black.withOpacity(0.75), Colors.transparent],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [textWhite15w700('Haldi Outfits')],
              ),
            ),
          ],
        ),
        sizedBoxWidth(13.w)
      ],
    );
  }

  Widget bookmarkCircle() {
    var bookmark = false.obs;

    return Obx(() => GestureDetector(
          onTap: () {
            bookmark.value = !bookmark.value;
          },
          child: CircleAvatar(
              radius: 13.r,
              backgroundColor: AppColors.white,
              child: bookmark.value
                  ? Icon(Icons.bookmark,
                      color: AppColors.buttoncolour, size: 13.h)
                  : SvgPicture.asset('assets/svg/bookmark.svg', height: 11.h)),
        ));
  }
}
