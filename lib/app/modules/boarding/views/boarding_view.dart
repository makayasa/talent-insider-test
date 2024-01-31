import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/app/components/default_text.dart';
import 'package:skeleton/config/color_constants.dart';
import 'package:skeleton/config/constant.dart';

import '../controllers/boarding_controller.dart';

class BoardingView extends GetView<BoardingController> {
  const BoardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (value) {
                controller.pageIndex.value = value;
              },
              children: const [
                BoardingItem(
                  image: 'assets/boarding-1.png',
                  label: 'Upgrade skills,\nShow off credentials!',
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis  accumsan.',
                ),
                BoardingItem(
                  image: 'assets/boarding-2.png',
                  label: 'Gain Insights andread Thending Articles',
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis serun',
                ),
                BoardingItem(
                  image: 'assets/boarding-3.png',
                  label: 'Attend Events and Expand youir network!',
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis amet',
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => DotsIndicator(
              // dotsCount: controller.pageController.page?.round() ?? 0,
              dotsCount: 3,
              position: controller.pageIndex.value,
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.pageIndex.value != 2,
              replacement: const SizedBox(
                height: 20,
              ),
              child: Padding(
                padding: kDefaultScaffoldPadding,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      height: 20,
                      child: DefText('Skip', color: kBgWhite).semilarge,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BoardingItem extends StatelessWidget {
  const BoardingItem({
    super.key,
    required this.image,
    required this.label,
    required this.text,
  });
  final String image;
  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 197),
        Center(
          child: Image.asset(
            image,
          ),
        ),
        const SizedBox(height: 68),
        Padding(
          padding: kDefaultScaffoldPadding,
          child: DefText(
            label,
            color: kBgWhite,
          ).huge,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: kDefaultScaffoldPadding,
          child: DefText(
            text,
            color: kBgWhite,
          ).semilarge,
        ),
      ],
    );
  }
}
