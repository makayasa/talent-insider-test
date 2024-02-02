import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:skeleton/app/controllers/network_controller.dart';
import 'package:skeleton/app/routes/app_pages.dart';
import 'package:skeleton/config/environtment.dart';

import '../../../../config/function_utils.dart';

class ListAudioBookController extends GetxController {
  final listAudioBooks = [].obs;
  final network = Get.find<NetworkController>();

  Future<void> getAudioBooks() async {
    try {
      dio.Response res = await network.get(
        '$baseUrl/2810aabc-9dc5-4d37-8ff1-fd579e9d6f0c/audio',
      );
      listAudioBooks.addAll(res.data);
    } on dio.DioException catch (e) {
      logKey('error getAudioBooks ${e.message}', e.response);
    }
  }

  void toDetailAudioBook(String uuid) {
    Get.toNamed(
      Routes.DETAIL_AUDIO_BOOK,
      arguments: {'uuid': uuid},
    );
  }

  void initialFunction() async {
    await getAudioBooks();
  }

  @override
  void onInit() {
    super.onInit();
    initialFunction();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
