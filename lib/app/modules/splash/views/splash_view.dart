import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 1),
        controller
            .navigateToNextPage); // 3 saniye sonra navigateToNextPage fonksiyonunu çalıştır
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              height: 350.h,
              width: 350.w,
              child: SvgPicture.asset("images/workpid_logo.svg"),
            ),
            Positioned(
              left: 120.w,
              bottom: 20.h,
              child: Text(
                "WorkPid",
                style: TextStyle(color: Colors.white, fontSize: 25.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
