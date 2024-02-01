import 'package:get/get.dart';

import '../controllers/list_audio_book_controller.dart';

class ListAudioBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListAudioBookController>(
      () => ListAudioBookController(),
    );
  }
}
