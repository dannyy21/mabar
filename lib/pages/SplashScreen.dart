import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routename.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Get.toNamed(RouteName.page_3));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset(
        'assets/images/ic_splashscreen.png',
      ),
    );
  }
}
