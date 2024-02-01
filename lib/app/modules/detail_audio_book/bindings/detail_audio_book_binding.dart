import 'package:get/get.dart';

import '../controllers/detail_audio_book_controller.dart';

class DetailAudioBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAudioBookController>(
      () => DetailAudioBookController(),
    );
  }
}
