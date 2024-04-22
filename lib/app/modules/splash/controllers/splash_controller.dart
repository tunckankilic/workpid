import 'dart:async';

import 'package:get/get.dart';
import 'package:workpid/app/modules/onboarding/views/onboarding_view.dart';
import 'package:workpid/app/routes/app_pages.dart';

class SplashController extends GetxController {
  Timer? timer;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void navigateToNextPage() {
    print("Attempting to navigate to the next page...");
    var result = Get.off(() => OnboardingView());
    print("Navigation result: $result");
  }

  @override
  void onClose() {
    timer?.cancel(); // Controller kapatılırken timer'ı iptal edin
    super.onClose();
  }
}
