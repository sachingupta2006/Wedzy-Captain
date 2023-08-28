import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Utils/Common/texts.dart';
import '../../../Utils/Common/themedata.dart';
import '../../../Utils/Widgets/common_appbar_dynamic.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBarDynamic(
          titleTxt: 'Privacy', preferredSize: Size.fromHeight(50)),
      body: SingleChildScrollView(
        child: Container(
          decoration: ShapeDecoration(
            color: const Color(0xFFFEF3F8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            shadows: const [
              BoxShadow(
                color: Color(0xFFFFC1DD),
                blurRadius: 0,
                offset: Offset(1, 2),
              )
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          margin: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textBlack15w400(
                  '''Qorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.
      Curabitur tempor quis eros tempus lacinia. Nam bibendum pellentesque quam a convallis. Sed ut vulputate nisi. Integer in felis sed leo vestibulum venenatis. Suspendisse quis arcu sem. Aenean feugiat ex eu vestibulum vestibulum. Morbi a eleifend magna. Nam metus lacus, porttitor eu mauris a, blandit ultrices nibh. Mauris sit amet magna non '''),
            ],
          ),
        ),
      ),
    );
  }
}
