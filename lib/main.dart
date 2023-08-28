import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) => GetMaterialApp(
        title: 'Wedzy Captain',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        initialRoute: '/',
        getPages: AppRoutes.appRoutes(),
      ),
      designSize: const Size(360, 800),
    );
  }
}
