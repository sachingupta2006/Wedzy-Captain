import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedzy_captain/Routes/route_name.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';
import 'package:wedzy_captain/Utils/Widgets/dropdowntextform_field.dart';

class Vendorsmain extends StatefulWidget {
  const Vendorsmain({super.key});

  @override
  State<Vendorsmain> createState() => _VendorsmainState();
}

class _VendorsmainState extends State<Vendorsmain> {
  List vendorData = [
    {
      "image": "assets/images/venues.png",
      "text": "Venues",
    },
    {
      "image": "assets/images/photography.png",
      "text": "Photography",
    },
    {
      "image": "assets/images/makeup.png",
      "text": "Makeup",
    },
    {
      "image": "assets/images/decoration.png",
      "text": "Decoration",
    },
    {
      "image": "assets/images/mehandi.png",
      "text": "Mehendi",
    },
    {
      "image": "assets/images/bartender.png",
      "text": "Bartender",
    },
    {
      "image": "assets/images/catering.png",
      "text": "Catering",
    },
    {
      "image": "assets/images/dj.png",
      "text": "DJ",
    },
    {
      "image": "assets/images/talent.png",
      "text": "Talents",
    },
    {
      "image": "assets/images/cake.png",
      "text": "Cakes",
    },
    {
      "image": "assets/images/chorography.png",
      "text": "Choreography",
    },
    {
      "image": "assets/images/jewellery.png",
      "text": "Jewellery",
    },
    {
      "image": "assets/images/clothing.png",
      "text": "Clothing",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarDynamic(
        titleTxt: "Vendors",
        preferredSize: const Size.fromHeight(50),
        backArrow: false,
        suffixWidget: Padding(
          padding: EdgeInsets.only(right: 17.w, top: 0.h),
          child: SvgPicture.asset(
            "assets/svg/bookmark.svg",
            width: 24.w,
            height: 24.h,
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                text373434_14w500("All Wedding Vendors"),
                SizedBox(
                  width: 89.w,
                  height: 27.w,
                  // height: ,
                  child: CommonDropdownBtn(
                      islocation: true,
                      hint: "Mumbai",
                      items: [
                        "Malad West, Mumbai....",
                        "Andheri West, Mumbai....",
                        "Goregaon, Mumbai....",
                        "Churchgate, Mumbai....",
                      ]),
                )
              ],
            ),
          ),
          sizedBoxHeight(10.h),
          Expanded(
            child: SingleChildScrollView(
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: vendorData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 0.h,
                      childAspectRatio: 1,
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return vendorcard(
                        index: index,
                        png: vendorData[index]["image"],
                        text: vendorData[index]["text"]);
                  }),
            ),
          )
        ],
      )),
    );
  }

  Widget vendorcard({required String png, required String text, index}) {
    // var
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,

      children: [
        GestureDetector(
          onTap: () {
            switch (index) {
              case 0:
                Get.toNamed(RouteName.venuepage);
                break;
              case 1:
                Get.toNamed(RouteName.photographypage);
                break;
              case 2:
                Get.toNamed(RouteName.makeuppage);
                break;
              case 3:
                Get.toNamed(RouteName.decorationpage);
                break;
              case 4:
                Get.toNamed(RouteName.mehendipage);
                break;
              case 5:
                Get.toNamed(RouteName.bartenderpage);
                break;
              case 6:
                Get.toNamed(RouteName.cateringpage);

                break;
              case 7:
                Get.toNamed(RouteName.djpage);

                break;
              case 8:
                Get.toNamed(RouteName.anchorpage);

                break;
              case 9:
                Get.toNamed(RouteName.cakepage);

                break;
              case 10:
                Get.toNamed(RouteName.choreopage);

                break;
              case 11:
                Get.toNamed(RouteName.jewellerypage);

                break;
              // case 12:
              // Get.toNamed(RouteName.clothingpage);
              //   break;
              default:
                Get.toNamed(RouteName.clothingpage);
            }
          },
          child: CircleAvatar(
            radius: 39.h,
            backgroundImage: AssetImage(png),
          ),
        ),
        sizedBoxHeight(3.h),
        Flexible(child: text373434_15w400(text)),
      ],
    );
  }
}

// class RequiredDropdownBtn extends StatefulWidget {
//   const RequiredDropdownBtn({
//     required this.hint,
//     required this.items,
//     this.isEnabled = true,
//     this.onItemSelected,
//     bool showAddButton = false,
//     super.key,
//   });
//   final String hint;
//   final List<String>? items;
//   final void Function(String)? onItemSelected;
//   final bool isEnabled;
//   @override
//   State<RequiredDropdownBtn> createState() => _RequiredDropdownBtnState();
// }

// class _RequiredDropdownBtnState extends State<RequiredDropdownBtn> {
//   late String label;
//   final List<String> items = [
//     'Item1',
//     'Item2',
//     'Item3',
//     'Item4',
//     'Item5',
//     'Item6',
//     'Item7',
//     'Item8',
//   ];
//   String? selectedValue;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2(
//         isExpanded: true,
//         hint: Row(
//           children: [
//             SizedBox(
//               width: 4,
//             ),
//             Expanded(
//               child: Text(
//                 widget.hint,
//                 style: TextStyle(
//                   fontSize: 18.sp,
//                   //fontWeight: FontWeight.bold,
//                   color: Color(0xFF4D4D4D),
//                 ),
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ],
//         ),
//         items: widget.items!
//             .map((item) => DropdownMenuItem<String>(
//                   value: item,
//                   child: Text(
//                     item,
//                     style: TextStyle(
//                       fontSize: 16.sp,
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w400,
//                       //fontWeight: FontWeight.bold,
//                       color: Color(0xFF000000),
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ))
//             .toList(),
//         value: selectedValue,
//         onChanged: (value) {
//           setState(() {
//             selectedValue = value as String;
//           });
//         },
//         buttonStyleData: ButtonStyleData(
//           height: 50.h,
//           width: double.infinity,
//           padding: const EdgeInsets.only(left: 14, right: 14),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(
//               color: Color(0xffFEF3F8),
//             ),
//             color: Color(0xffFEF3F8),
//           ),
//           elevation: 0,
//         ),
//         iconStyleData: IconStyleData(
//           icon: Icon(
//             Icons.keyboard_arrow_down,
//           ),
//           iconSize: 23.sp,
//           iconEnabledColor: Color(0xFFEF2B7B),
//           iconDisabledColor: Color(0XFFEF2B7B),
//         ),
//         dropdownStyleData: DropdownStyleData(
//           maxHeight: 200,

//           padding: null,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(
//               color: Color(0xffCCCCCC),
//             ),
//             color: Colors.white,
//           ),
//           elevation: 1,
//           // offset: const Offset(-20, 0),
//           scrollbarTheme: ScrollbarThemeData(
//             radius: const Radius.circular(40),
//             thickness: MaterialStateProperty.all<double>(6),
//             thumbVisibility: MaterialStateProperty.all<bool>(true),
//           ),
//         ),
//         menuItemStyleData: const MenuItemStyleData(
//           height: 40,
//           padding: EdgeInsets.only(left: 14, right: 14),
//         ),
//       ),
//     );
//   }
// }
