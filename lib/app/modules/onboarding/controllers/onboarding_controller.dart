import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:workpid/app/modules/onboarding/widgets/page_item.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  final List<Widget> pages = [
    PageItem(image: 'images/connect.jpeg', text: 'Connect with the world'),
    PageItem(image: 'images/connection.jpeg', text: 'Stay connected'),
    PageItem(image: 'images/network.jpeg', text: 'Expand your network'),
  ];
  RxInt currentIndex = 0.obs; // Reactive integer for current page index

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose(); // Don't forget to dispose controllers
    super.onClose();
  }
}
