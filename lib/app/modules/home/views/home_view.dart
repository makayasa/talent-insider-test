import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/app/components/default_button.dart';
import 'package:skeleton/app/components/default_text.dart';
import 'package:skeleton/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultButton(
              onTap: () {
                Get.toNamed(Routes.LIST_AUDIO_BOOK);
              },
              width: 150,
              child: Center(
                child: DefText('List Audio Book').normal,
              ),
            ),
            const SizedBox(height: 20),
            DefaultButton(
              onTap: () {
                Get.toNamed(Routes.LIST_COURSE);
              },
              width: 150,
              child: Center(
                child: DefText('List Course').normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
