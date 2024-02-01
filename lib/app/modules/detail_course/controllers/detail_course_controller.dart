import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:skeleton/app/controllers/network_controller.dart';
import 'package:video_player/video_player.dart';

import '../../../../config/environtment.dart';
import '../../../../config/function_utils.dart';

class DetailCourseController extends GetxController {
  final network = Get.find<NetworkController>();
  final isLoading = true.obs;

  // final videourl = 'https://api.kontenbase.com/upload/file/storage/65a0e330fac3f5febba7f7f8/Talent%20Insider%20-%20Learning-iuwgfGEU.webm';
  late ChewieController chewieController;
  late VideoPlayerController videoController;

  final courseData = {}.obs;
  final listChapters = [].obs;

  Future<void> getCourse() async {
    final arg = Get.arguments;
    final url = '$baseUrl/2810aabc-9dc5-4d37-8ff1-fd579e9d6f0c/courses/?id=${arg['uuid']}&' r'$lookup=*';
    logKey('url', url);
    try {
      Response res = await network.get(url);
      logKey('url $url', res.data);
      courseData.assignAll(res.data.first);
      // logKey('pathh', courseData['path'].first['url'].replaceAll(' ', '%20'));
      videoController = VideoPlayerController.networkUrl(
        Uri.parse(
          'https://api.kontenbase.com/upload/file/storage/65a0e330fac3f5febba7f7f8/Talent%20Insider%20-%20Learning-vCegQNCX.webm',
        ),
      );
      await videoController.initialize();
      chewieController = ChewieController(
        videoPlayerController: videoController,
        aspectRatio: 16 / 9,
        // aspectRatio: 21 / 9,
        autoInitialize: true,
        autoPlay: true,
      );
      await getLesson();
      isLoading.value = false;
    } on DioException catch (e) {
      logKey('error getCourse ${e.message}', e.response);
      isLoading.value = false;
      return;
    }
  }

  Future<void> getLesson() async {
    const url = '$baseUrl/2810aabc-9dc5-4d37-8ff1-fd579e9d6f0c/chapter?' r'$lookup=*';
    try {
      Response res = await network.get(url);
      // logKey('res getLesson', res.data);
      listChapters.addAll(res.data);
      await getLessonContent();
    } on DioException catch (e) {
      logKey('error getLesson ${e.message}', e.response);
    }
  }

  Future<void> getLessonContent() async {
    try {
      Response res = await network.get(
        '$baseUrl/2810aabc-9dc5-4d37-8ff1-fd579e9d6f0c/lesson/',
      );
      for (var data in res.data) {
        for (var i = 0; i < listChapters.length; i++) {
          final List listLessoninChapter = listChapters[i]['lesson'];
          final indexChapter = listLessoninChapter.indexWhere(
            (element) => element['_id'] == data['_id'],
          );
          if (indexChapter != -1) {
            listChapters[i]['lesson'][indexChapter]['path'] = data['path'];
          }
        }
      }
    } on DioException catch (e) {
      logKey('error getLessonContent${e.message}', e.response);
    }
  }

  void playCurrentLesson(String videoUrl) async {
    videoController = videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        videoUrl,
        // "https://cdn.discordapp.com/attachments/873173146495250482/1202616186777370694/VID_20240123_194813.mp4?ex=65ce1a9a&is=65bba59a&hm=393a9f3c5a46d3a261ea04f6ca17b874190060c17359da0394c754264f8f58d4&",
      ),
    );
    await videoController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoController,
      aspectRatio: 16 / 9,
      // aspectRatio: 21 / 9,
      autoInitialize: true,
      autoPlay: true,
    );
    chewieController.play();
    update(['1']);
  }

  void initialFunction() async {
    // await getCourse();
    await getCourse();
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
    videoController.dispose();
    chewieController.dispose();
  }
}
