import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/app/components/default_text.dart';
import 'package:skeleton/config/color_constants.dart';
import 'package:skeleton/config/constant.dart';

import '../controllers/list_audio_book_controller.dart';

class ListAudioBookView extends GetView<ListAudioBookController> {
  const ListAudioBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListAudioBookView'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          padding: kDefaultScaffoldPadding.copyWith(top: 20, bottom: 20),
          itemCount: controller.listAudioBooks.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.toDetailAudioBook(
                  controller.listAudioBooks[index]['_id'],
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: const BoxDecoration(
                  color: kBgBlack,
                  borderRadius: kDefaultBorderRadius10,
                ),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: controller.listAudioBooks[index]['thumbnail'].first['url'],
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefText(
                            controller.listAudioBooks[index]['title'],
                          ).semilarge,
                          DefText(
                            controller.listAudioBooks[index]['artist'],
                          ).semiSmall,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
