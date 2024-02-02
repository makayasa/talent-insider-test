import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/app/components/default_text.dart';
import 'package:skeleton/app/modules/detail_audio_book/controllers/detail_audio_book_controller.dart';
import 'package:skeleton/config/color_constants.dart';
import 'package:skeleton/config/constant.dart';
import 'package:skeleton/config/function_utils.dart';

class AudioPlayerSheet extends GetView<DetailAudioBookController> {
  const AudioPlayerSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: kBgWhite,
                  ),
                ),
                Column(
                  children: [
                    DefText(
                      'PLAYING FROM SEARCH',
                    ).semilarge,
                    DefText(
                      '"UX" in Search',
                    ).semilarge,
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: kBgWhite,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: kDefaultScaffoldPadding,
              height: 450,
              width: Get.width,
              child: ClipRRect(
                borderRadius: kDefaultBorderRadius10,
                child: CachedNetworkImage(
                  imageUrl: controller.audioBookData['thumbnail'].first['url'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: kDefaultScaffoldPadding,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefText(
                          controller.audioBookData['title'],
                          maxLine: 1,
                        ).large,
                        DefText(
                          '${controller.audioBookData['artist']} - ${controller.audioBookData['jobTitle']}',
                        ).normal,
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Image.asset(
                    'assets/audio.png',
                    height: 25,
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.play_arrow,
                    color: kBgWhite,
                  ),
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
                  const Spacer(),
                  DefText('${dateFormater(controller.audioBookData['createdAt'], dateFormat: 'MMM dd')} | in ${controller.audioBookData['languange']}').normal,
                ],
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Slider(
                value: controller.audioPosition.value,
                activeColor: kBgWhite,
                inactiveColor: kInactiveColor,
                onChanged: (value) {
                  controller.seekPlay(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Obx(
                    () => DefText(
                      // '1:23',
                      durationFormat(controller.currentAudioPosition.value),
                    ).normal,
                  ),
                  const Spacer(),
                  Obx(
                    () => DefText(
                      durationFormat(controller.audioDuration.value),
                    ).normal,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: kDefaultScaffoldPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.share,
                      color: kBgWhite,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.skip_previous,
                      color: kBgWhite,
                    ),
                    onPressed: () {},
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: kBgWhite,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      color: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: Obx(
                        () => Icon(
                          controller.isPlay.value ? Icons.pause : Icons.play_arrow,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        if (controller.isPlay.value) {
                          controller.pause();
                          return;
                        }
                        controller.play();
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.skip_next,
                      color: kBgWhite,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.bookmark,
                      color: kBgWhite,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
