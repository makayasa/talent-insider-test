import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/app/components/default_text.dart';
import 'package:skeleton/config/color_constants.dart';
import 'package:skeleton/config/constant.dart';

import '../controllers/detail_course_controller.dart';

class DetailCourseView extends GetView<DetailCourseController> {
  const DetailCourseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DetailCourseController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailCourseView'),
        centerTitle: true,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     if (controller.videoController.value.isPlaying) {
      //       controller.videoController.pause();
      //       return;
      //     }
      //     controller.videoController.play();
      //   },
      // ),
      body: ListView(
        children: [
          SizedBox(
            height: 200,
            child: Chewie(
              controller: controller.chewieController,
            ),
          ),
          DefText(
            'ChatGPT & Midjourney: 23 Ways of Earning Money with AI',
            color: kBgWhite,
          ).large,
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final isExpanded = false.obs;
              final kunci = GlobalKey();
              return Obx(
                () => GestureDetector(
                  onTap: () {
                    isExpanded.value = !isExpanded.value;
                  },
                  child: ChapterCard(
                    kunci: kunci,
                    isExpand: isExpanded.value,
                    index: index,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ChapterCard extends StatelessWidget {
  const ChapterCard({
    super.key,
    required this.isExpand,
    required this.index,
    required this.kunci,
  });
  final bool isExpand;
  final int index;
  final GlobalKey kunci;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HeaderChapter(index: index),
        AnimatedContainer(
          duration: kDefaultFastDuration,
          curve: kDefaultCurve,
          height: isExpand ? (kunci.currentContext!.findRenderObject() as RenderBox).size.height : 50,
          color: index % 2 == 0 ? Colors.black : Colors.grey,
          padding: kDefaultScaffoldPadding,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              key: kunci,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefText(
                      'Chapter 1',
                      color: kBgWhite,
                    ).normal,
                    Row(
                      children: [
                        DefText(
                          '3 Lesson',
                          color: kBgWhite,
                        ).normal,
                        const SizedBox(width: 10),
                        DefText(
                          '18 min',
                          color: kBgWhite,
                        ).normal,
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                DefText(
                  'Introduction to the ChatGPT  Midjourney asdsadsda asdasdasd asdasd...',
                  maxLine: 1,
                  color: kBgWhite,
                ).semilarge,
                const SizedBox(height: 10),
                ListView.separated(
                  // key: kunci,
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    // return const SizedBox(height: 10);
                    return const Divider(
                      color: kBgWhite,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 28,
                              width: 28,
                              color: kInactiveColor,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefText(
                                  'Lesson $index',
                                  color: kBgWhite,
                                ).normal,
                                // const SizedBox(height: 5),
                                DefText(
                                  'Welcome to 23 Ways of Earning Money with AI',
                                  color: kBgWhite,
                                ).flex,
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            DefText(
                              '14 mins',
                              color: kBgWhite,
                            ).extraSmall,
                            const Spacer(),
                            const Icon(
                              Icons.play_arrow,
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HeaderChapter extends StatelessWidget {
  const HeaderChapter({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          color: index % 2 == 1 ? Colors.black : Colors.grey,
          // color: Colors.green,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: index % 2 == 1 ? Colors.black : Colors.grey,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: index % 2 == 0 ? Colors.black : Colors.grey,
                      borderRadius: const BorderRadius.only(
                        // topRight: Radius.elliptical(100, 50),
                        topRight: Radius.elliptical(100, 100),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: index % 2 == 1 ? Colors.black : Colors.grey,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(4.5),
                  bottomRight: Radius.circular(4.5),
                ),
              ),
              height: 40,
              width: 120,
              child: Center(
                child: Container(
                  height: 10,
                  color: index % 2 == 0 ? Colors.black : Colors.grey,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: index % 2 == 1 ? Colors.black : Colors.grey,
                child: ClipRRect(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: index % 2 == 0 ? Colors.black : Colors.grey,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.elliptical(100, 100),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
