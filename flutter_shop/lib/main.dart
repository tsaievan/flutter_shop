import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/page/main_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
        builder: () => MaterialApp(
      title: KString.MAIN_TITLE,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: KColor.PRIMARY_COLOR,
      ),
      home: MainPage(),
    )
    );
  }
}

