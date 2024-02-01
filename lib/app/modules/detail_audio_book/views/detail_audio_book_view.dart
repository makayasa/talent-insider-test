import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/app/components/default_button.dart';
import 'package:skeleton/app/components/default_text.dart';
import 'package:skeleton/config/color_constants.dart';
import 'package:skeleton/config/constant.dart';

import '../controllers/detail_audio_book_controller.dart';

class DetailAudioBookView extends GetView<DetailAudioBookController> {
  const DetailAudioBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefText(
                  'How to build intentional UX in an era of persuasive technology',
                ).huge,
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/user-1.png',
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefText('Emily').semiSmall,
                        // const SizedBox(height: 5),
                        DefText('UI/UX Designer').semiSmall,
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: const BoxDecoration(
                        color: kInactiveColor,
                        borderRadius: kDefaultBorderRadius10,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/category.png',
                            height: 24,
                          ),
                          const SizedBox(width: 5),
                          DefText('Soft Skills').normal,
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: kDefaultBorderRadius10,
                        border: Border.all(
                          color: kGoldColor,
                        ),
                      ),
                      child: DefText('Premium').normal,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: DefText(
                        'Aug 4 |  min read | in English',
                        maxLine: 1,
                      ).extraSmall,
                    ),
                  ],
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
                DefText(
                  'I’ve mentioned before that I do mentoring and consulting for UX designers. Sometimes they send me links to their portfolio direct. Today I want to talk about typical mistakes that pop up from time to time in the work of beginners. I want to dwell on each separately and tell you how to avoid them. Ready?',
                ).semilarge,
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
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_arrow,
                            color: kBgWhite,
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
