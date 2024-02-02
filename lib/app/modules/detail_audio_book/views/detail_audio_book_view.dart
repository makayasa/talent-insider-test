import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/app/components/default_button.dart';
import 'package:skeleton/app/components/default_text.dart';
import 'package:skeleton/config/color_constants.dart';
import 'package:skeleton/config/constant.dart';
import 'package:skeleton/config/function_utils.dart';

import '../components/audio_player_sheet.dart';
import '../controllers/detail_audio_book_controller.dart';

class DetailAudioBookView extends GetView<DetailAudioBookController> {
  const DetailAudioBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => AnimatedCrossFade(
            crossFadeState: controller.isLoading.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: kDefaultFastDuration,
            layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
              return topChild;
            },
            firstChild: SizedBox(
              height: Get.height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            secondChild: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Container(
                        padding: kDefaultScaffoldPadding,
                        child: DefText(
                          // 'How to build intentional UX in an era of persuasive technology',
                          controller.audioBookData['title'],
                        ).huge,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: kDefaultScaffoldPadding,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/user-1.png',
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => DefText(
                                  controller.audioBookData['artist'],
                                ).semiSmall,
                              ),
                              // const SizedBox(height: 5),
                              Obx(
                                () => DefText(
                                  controller.audioBookData['jobTitle'],
                                ).semiSmall,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: kDefaultScaffoldPadding,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: const BoxDecoration(
                              color: kBgBlack,
                              borderRadius: kDefaultBorderRadius10,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/category.png',
                                  height: 20,
                                ),
                                const SizedBox(width: 5),
                                DefText('Soft Skills').normal,
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Obx(
                            () => Visibility(
                              visible: controller.audioBookData['isPremium'] == 'yes',
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: kDefaultBorderRadius10,
                                  border: Border.all(
                                    color: kGoldColor,
                                  ),
                                ),
                                child: DefText('Premium').normal,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: DefText(
                                '${dateFormater(controller.audioBookData['createdAt'], dateFormat: 'MMM dd')} | 2 min read | in ${controller.audioBookData['languange']}',
                                maxLine: 1,
                              ).flex,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: 'https://api.kontenbase.com/upload/file/storage/65a0e330fac3f5febba7f7f8/EmotionalIntelligence2.0-UJKxtUVE.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Obx(
                      () => DefText(
                        // 'I’ve mentioned before that I do mentoring and consulting for UX designers. Sometimes they send me links to their portfolio direct. Today I want to talk about typical mistakes that pop up from time to time in the work of beginners. I want to dwell on each separately and tell you how to avoid them. Ready?',
                        controller.audioBookData['description'],
                      ).semilarge,
                    ),
                  ],
                ),
                Align(
                  // top: Get.height - 250,
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        // height: 250,
                        width: Get.width,
                        color: kBgBlack,
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              height: 50,
                              width: 50,
                              imageUrl: 'https://api.kontenbase.com/upload/file/storage/65a0e330fac3f5febba7f7f8/EmotionalIntelligence2.0-UJKxtUVE.jpg',
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DefText(
                                    'How to build intentional UX in an era of persuasive technology',
                                    maxLine: 1,
                                  ).semiSmall,
                                  DefText(
                                    'Emily | UI/UX Designer',
                                  ).semiSmall,
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                            Image.asset(
                              'assets/audio.png',
                              height: 25,
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {
                                Get.bottomSheet(
                                  const AudioPlayerSheet(),
                                  isScrollControlled: true,
                                  enableDrag: false,
                                );
                              },
                              icon: Obx(
                                () => Icon(
                                  controller.isPlay.value ? Icons.pause : Icons.play_arrow,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: kDefaultScaffoldPadding,
                        child: Row(
                          children: [
                            Expanded(
                              child: DefaultButton(
                                onTap: () {},
                                child: Center(
                                  child: DefText('Bookmark').semilarge,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const SizedBox(
                              width: 80,
                              child: DefaultButton(
                                showBorder: true,
                                color: Colors.black,
                                child: Center(
                                  child: Icon(
                                    Icons.share,
                                    color: kBgWhite,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
