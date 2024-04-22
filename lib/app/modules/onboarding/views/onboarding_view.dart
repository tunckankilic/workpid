import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:workpid/app/globals/theme_constants.dart';
import 'package:workpid/app/modules/login/views/login_view.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  OnboardingView({Key? key}) : super(key: key);
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: <Widget>[
            PageView.builder(
              controller: controller.pageController,
              itemCount: controller.pages.length,
              onPageChanged: (int index) {
                controller.currentIndex.value =
                    index; // This updates the currentIndex reactively
              },
              itemBuilder: (_, index) {
                return controller.pages[index];
              },
            ),
            if (controller.currentIndex.value == 2)
              Positioned(
                bottom: 140.h,
                left: 250.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.sp)),
                    backgroundColor: ThemeConstants.themeColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Get.offAll(
                      LoginView(),
                    );
                  },
                  child: Text(
                    "Login -->",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
                  ),
                ),
              ),
            Positioned(
              bottom:
                  150.h, // Example position, adjust according to your UI needs
              left: 150.h,

              child: Center(
                child: Obx(
                  () => // Use Obx here to make DotsIndicator reactive
                      DotsIndicator(
                    dotsCount: controller.pages.length,
                    position: controller.currentIndex.value,
                    decorator: DotsDecorator(
                      activeColor: Colors.red,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
