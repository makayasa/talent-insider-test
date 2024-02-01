import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardingController extends GetxController {
  final pageController = PageController();
  // final carouselController = CarouselController();
  final pageIndex = 0.obs;
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
    super.onClose();
    pageController.dispose();
  }
}
