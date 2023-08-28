import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedzy_captain/View/Chat/messages.dart';
import 'package:wedzy_captain/View/Home/Duo/manage_duo.dart';
import 'package:wedzy_captain/View/Vendors/vendorsmain.dart';
import '../../Utils/Common/texts.dart';
import '../../Utils/Common/themedata.dart';
import 'home.dart';
import 'nav_drawer.dart';
import 'Task/tasks.dart';

final selectedIndexBottomBar = 2.obs;
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    final List widgetOptions = [
      const Tasks(),
      const Vendorsmain(),
      const Home(),
      const ManageDuo(),
      const Messagepage(),
    ];
    return Obx(() => WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            drawer: const NavDrawer(),
            extendBody: true,
            body: widgetOptions.elementAt(selectedIndexBottomBar.value),
            bottomNavigationBar: CurvedNavigationBar(
                // animationDuration: const Duration(milliseconds: 900),
                index: selectedIndexBottomBar.value,
                backgroundColor: AppColors.buttoncolour,
                buttonBackgroundColor: AppColors.buttoncolour,
                height: 60.h,
                onTap: (value) {
                  selectedIndexBottomBar.value = value;
                },
                items: [
                  bottomWidget('assets/svg/Task.svg', 'Task', 0),
                  bottomWidget('assets/svg/Vendors.svg', 'Vendors', 1),
                  bottomWidget('assets/svg/Home.svg', 'Home', 2),
                  bottomWidget('assets/svg/Duo.svg', 'Duo', 3),
                  bottomWidget('assets/svg/Chat.svg', 'Chat', 4),
                ]),
          ),
        ));
  }

  Widget bottomWidget(String svg, String title, int position) {
    return Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              svg,
              // ignore: deprecated_member_use
              color: selectedIndexBottomBar.value == position
                  ? AppColors.white
                  : null,
            ),
            selectedIndexBottomBar.value != position
                ? text373737_12w400(title)
                : const SizedBox()
          ],
        ));
  }
}
