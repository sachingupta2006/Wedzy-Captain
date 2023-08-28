import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';

class CommonDropdownBtn extends StatefulWidget {
  const CommonDropdownBtn({
    required this.hint,
    required this.items,
    this.isEnabled = true,
    this.islocation = false,
    this.onItemSelected,
    bool showAddButton = false,
    super.key,
  });
  final String hint;
  final List<String>? items;
  final void Function(String)? onItemSelected;
  final bool isEnabled;
  final bool islocation;

  @override
  State<CommonDropdownBtn> createState() => _CommonDropdownBtnState();
}

class _CommonDropdownBtnState extends State<CommonDropdownBtn> {
  late String label;
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return
        // Container(
        //   // width: 50,
        //   // height: 50,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10),
        //       border: Border.all(color: Color(0xffFEF3F8)),
        //       color: Color(0x21EF2B7B)),
        //   child: Row(
        //     children: [
        //       widget.islocation
        //           ? SvgPicture.asset("assets/svg/location.svg")
        //           : SizedBox(),
        //       // Icon(Icons.arrow_drop_down),
        //       Expanded(
        //         child: DropdownButton<String>(
        //           value: selectedValue,
        //           hint: Padding(
        //             padding: const EdgeInsets.only(left: 2),
        //             child: Text(
        //               widget.hint,
        //               style: TextStyle(
        //                   fontSize: 12.sp,
        //                   //fontWeight: FontWeight.bold,
        //                   color: AppColors.buttoncolour,
        //                   fontWeight: FontWeight.w500),
        //               overflow: TextOverflow.ellipsis,
        //             ),
        //           ),
        //           dropdownColor: Color(0xffFEF3F8),
        //           onChanged: (value) {
        //             setState(() {
        //               selectedValue = value as String;
        //             });
        //           },
        //           icon: SizedBox.shrink(),
        //           style: TextStyle(color: Colors.black),
        //           underline: Container(
        //             height: 0,
        //             color: Color(0x21EF2B7B),
        //           ),
        //           items: widget.items!
        //               .map((item) => DropdownMenuItem<String>(
        //                     value: item,
        //                     child: Text(
        //                       item,
        //                       style: TextStyle(
        //                         color: Color(0xFF373434),
        //                         fontSize: 14.sp,
        //                         fontFamily: 'Montserrat',
        //                         fontWeight: FontWeight.w500,
        //                       ),
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                   ))
        //               .toList(),
        //         ),
        //       ),
        //       Icon(
        //         Icons.arrow_drop_down,
        //         color: AppColors.buttoncolour,
        //       ),
        //     ],
        //   ),
        // );

        DropdownButtonHideUnderline(
      child: Container(
        // width: 60,
        // height: 27.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xffFEF3F8)),
            color: Color(0x21EF2B7B)),
        child: Row(
          children: [
            widget.islocation
                ? Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: SvgPicture.asset("assets/svg/location.svg"),
                  )
                : SizedBox(),
            Expanded(
              child: DropdownButton2(
                isExpanded: true,
                hint: Row(
                  children: [
                    // SizedBox(
                    //   width: 4,
                    // ),
                    // widget.islocation
                    //     ? SvgPicture.asset("assets/svg/location.svg")
                    //     : SizedBox(),

                    // widget.islocation ? sizedBoxWidth(4.w) : SizedBox(),

                    Expanded(
                      child: Text(
                        widget.hint,
                        style: TextStyle(
                            fontSize: 12.sp,
                            //fontWeight: FontWeight.bold,
                            color: AppColors.buttoncolour,
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: widget.items!
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              color: AppColors.buttoncolour,
                              fontSize: 12.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 50.h,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 6, right: 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xffFEF3F8),
                    ),
                    // color: Color(0x21EF2B7B),
                  ),
                  elevation: 0,
                ),
                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  iconSize: 23.sp,
                  iconEnabledColor: Color(0xFFEF2B7B),
                  iconDisabledColor: Color(0XFFEF2B7B),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: 240,
                  padding: null,
                  // padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xffCCCCCC),
                    ),
                    color: Colors.white,
                  ),
                  elevation: 0,
                  // offset: const Offset(-20, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all<double>(6),
                    thumbVisibility: MaterialStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
