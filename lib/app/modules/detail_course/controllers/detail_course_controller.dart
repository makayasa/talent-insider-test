import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class DetailCourseController extends GetxController {
  final videourl = 'https://api.kontenbase.com/upload/file/storage/65a0e330fac3f5febba7f7f8/Talent%20Insider%20-%20Learning-iuwgfGEU.webm';
  late ChewieController chewieController;
  late VideoPlayerController videoController;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    videoController = VideoPlayerController.networkUrl(
      Uri.parse(videourl),
    )..initialize();
    chewieController = ChewieController(
      videoPlayerController: videoController,
      aspectRatio: 16 / 9,
      // aspectRatio: 21 / 9,
      autoInitialize: true,
      autoPlay: true,
    );
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
