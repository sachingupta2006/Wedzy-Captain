import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';

class ManageVendors extends StatefulWidget {
  const ManageVendors({super.key});

  @override
  State<ManageVendors> createState() => _ManageVendorsState();
}

class _ManageVendorsState extends State<ManageVendors> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBarDynamic(
          titleTxt: "Manage Vendors",
          preferredSize: const Size.fromHeight(90),
          search: true,
          useCustomWidget: true,
          customWidget: Stack(
            children: [
              TabBar(
                  indicatorColor: AppColors.buttoncolour,
                  indicatorWeight: 2.5.h,
                  labelPadding: EdgeInsets.only(bottom: 12.h),
                  tabs: [
                    text373434_15w400("Shortlisted"),
                    text373434_15w400("Finalised")
                  ]),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: -8.h,
                  child: Divider(
                    thickness: 0.25,
                    color: AppColors.buttoncolour,
                  ))
            ],
          ),
        ),
        body: TabBarView(children: [
          Shortlisted(),
          finalised(),
        ]),
      ),
    );
  }

  Widget finalised() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/svg/finalisedvendorsmile.svg"),
        sizedBoxHeight(26.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: text9B9B9B_15w400(
                    "Oops! Looks like we don’t seem to have anything related to your query right now"),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Shortlisted extends StatefulWidget {
  const Shortlisted({super.key});

  @override
  State<Shortlisted> createState() => _ShortlistedState();
}

class _ShortlistedState extends State<Shortlisted> {
  List shortlistdata = [
    {
      "text": "Wedding Venues",
    },
    {
      "text": "Bridal Makeup",
    },
    {
      "text": "     Wedding \nPhotographers",
    },
    {
      "text": " Wedding \nDecoraters",
    },
    {
      "text": "Wedding \nJewellery",
    },
    {
      "text": "Bridal Wear",
    },
    {
      "text": "Wedding \n   Cards",
    },
    {
      "text": "Wedding \n Catering",
    },
    {
      "text": "  Pre Wedding \nPhotographers",
    },
    {
      "text": "DJ",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          // sizedBoxWidth(20.h),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: shortlistdata.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20.h,
                      crossAxisSpacing: 20.w,
                      childAspectRatio: 1,
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return shortlistedcard(
                        index: index, text: shortlistdata[index]["text"]);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget shortlistedcard({required String text, index}) {
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            ;
            break;
          case 1:
            ;
            break;
          case 2:
            ;
            break;
          case 3:
            ;
            break;
          case 4:
            ;
            break;
          case 5:
            ;
            break;
          case 6:
            ;
            break;
          case 7:
            ;
            break;
          case 8:
            ;
            break;
          default:
            ;
        }
      },
      child: DottedBorder(
        color: Color(0xFFEF2B7B),
        strokeWidth: 2,
        dashPattern: [
          5,
          5,
        ],
        child: Container(
          // width: 153,
          // height: 202,
          // decoration: ShapeDecoration(
          //   shape: RoundedRectangleBorder(
          //     side: BorderSide(width: 0.50, color: Color(0xFFEF2B7B)),
          //     borderRadius: BorderRadius.circular(7),
          //   ),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Align(
                    alignment: Alignment.center,
                    child: text9B9B9B_12w400(text)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
