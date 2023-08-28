import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wedzy_captain/Routes/route_name.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';
import 'package:fl_chart/fl_chart.dart';

var totalBudget = 2000000.obs;

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map pieDataMap = {
      'pieTitle': [
        'Venue',
        'Photography',
        'DJ',
        'Make-up',
        'Jewellery',
        'Bartendar',
        'Mahendi',
        'Decoration',
        'Catering',
        'Wedding Attire',
        'Talents',
        'Choreographer',
        'Cakes'
      ],
      'colorList': [
        const Color(0xFFFF007C),
        const Color(0xFFFF1988),
        const Color(0xFFFF3396),
        const Color(0xFFFF4DA3),
        const Color(0xFFFF66B0),
        const Color(0xFFFF80BD),
        const Color(0xFFFF80BD),
        const Color(0xFFFFB3D7),
        const Color(0xFFFFCCE5),
        const Color(0xFFFFE0EF),
        const Color(0xFFFFEBF4),
        const Color(0xFFFFF0F7),
        const Color(0xFFFFF6FA)
      ],
    };

    // we have to manually enter customBudgetValue as initial Index => fromula : percenctEach /100
    var customBudgetValue = [
      300000,
      300000,
      300000,
      200000,
      100000,
      100000,
      100000,
      120000,
      180000,
      100000,
      100000,
      60000,
      40000
    ].obs;

    var customBudgetBool = false.obs;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBarDynamic(
        titleTxt: "Budget Revised",
        search: false,
        preferredSize: Size.fromHeight(50),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFEF3F8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Wrap(children: [
                    textEE3764_14w400('Total Budget:'),
                    textEE3764_16w700(' ₹ $totalBudget')
                  ]),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteName.mywallet);
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFEF2B7B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.50),
                      ),
                      shadows: const [
                        BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 2))
                      ],
                    ),
                    child: Image.asset('assets/images/wallet.png'),
                  ),
                )
              ],
            ),
            sizedBoxHeight(10.h),
            Obx(
              () => (customBudgetValue.fold(
                          0,
                          (previousValue, element) =>
                              previousValue + element)) >
                      totalBudget.value
                  ? CircleAvatar(
                      backgroundColor: const Color(0xFFFEF3F8),
                      radius: 120.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // textEE3764_18w400(
                          //     '${(((customBudgetValue.fold(0, (previousValue, element) => previousValue + element)) * 100) / totalBudget.value).toDouble()}%'),
                          textEE3764_14w400('You cannot exceed 100%')
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 370.h,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          PieChart(
                            PieChartData(
                              centerSpaceRadius: 80.w,
                              startDegreeOffset: 270,
                              sectionsSpace: 0.3,
                              sections: List.generate(
                                  pieDataMap['pieTitle'].length, (index) {
                                final reversedIndex =
                                    pieDataMap['pieTitle'].length - 1 - index;
                                return PieChartSectionData(
                                    radius: 90.w,
                                    color: pieDataMap['colorList']
                                        [reversedIndex],
                                    title:
                                        "${(customBudgetValue[reversedIndex] * 100) ~/ customBudgetValue.fold(0, (previousValue, element) => previousValue + element)}%",
                                    value: (customBudgetValue[reversedIndex] *
                                            100) /
                                        customBudgetValue
                                            .fold(
                                                0,
                                                (previousValue, element) =>
                                                    previousValue + element)
                                            .toDouble());
                              }),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // textEE3764_20w700(
                              //     '₹ ${customBudgetValue.fold(0, (previousValue, element) => previousValue + element)}'),
                              // sizedBoxHeight(5.h),
                              textEE3764_20w700(
                                  '${((customBudgetValue.fold(0, (previousValue, element) => previousValue + element)) * 100) ~/ totalBudget.value}%')
                            ],
                          )
                        ],
                      )),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Obx(() => Visibility(
                          visible: !customBudgetBool.value,
                          child: Column(
                            children: [
                              sizedBoxHeight(20.h),
                              Wrap(
                                spacing: 40.w,
                                runSpacing: 20.h,
                                children: List.generate(13, (index) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                          radius: 6.h,
                                          backgroundColor:
                                              pieDataMap['colorList'][index]),
                                      sizedBoxWidth(5.w),
                                      text373434_14w400(pieDataMap['pieTitle']
                                              [index]
                                          .toString()),
                                    ],
                                  );
                                }),
                              ),
                            ],
                          ),
                        )),
                    sizedBoxHeight(20.h),
                    textEF2B7B_18w400('Custom Budget'),
                    sizedBoxHeight(15.h),
                    GestureDetector(
                      onTap: () {
                        customBudgetBool.value = !customBudgetBool.value;
                      },
                      child: Container(
                          width: 48,
                          height: 48,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFFEF2B7B)),
                            ),
                          ),
                          child: Obx(() => Icon(
                              customBudgetBool.value
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: AppColors.buttoncolour))),
                    ),
                    Obx(() => Visibility(
                        visible: customBudgetBool.value,
                        child: Column(
                          children: List.generate(pieDataMap['pieTitle'].length,
                              (index) {
                            return Obx(() => Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 65,
                                              height: 33,
                                              decoration: ShapeDecoration(
                                                color: const Color(0xFFFF007C),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3)),
                                              ),
                                              child: Center(
                                                child: textBlack14w500(
                                                    '${(customBudgetValue[index] * 100) ~/ customBudgetValue.fold(0, (previousValue, element) => previousValue + element)}%'),
                                              ),
                                            ),
                                            sizedBoxWidth(10.w),
                                            textBlack14w500(
                                                pieDataMap['pieTitle'][index])
                                          ],
                                        ),
                                        textBlack14w500(
                                            '₹ ${customBudgetValue[index]}')
                                      ],
                                    ),
                                    sizedBoxHeight(20.h),
                                    Slider(
                                        value:
                                            customBudgetValue[index].toDouble(),
                                        onChanged: (value) {
                                          customBudgetValue[index] =
                                              value.toInt();
                                        },
                                        activeColor: AppColors.buttoncolour,
                                        inactiveColor: const Color(0xFFFFB3D7),
                                        max: totalBudget.toDouble(),
                                        min: 0)
                                  ],
                                ));
                          }),
                        ))),
                    sizedBoxHeight(20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
