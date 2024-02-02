import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:skeleton/app/controllers/network_controller.dart';
import 'package:skeleton/config/environtment.dart';
import 'package:skeleton/config/function_utils.dart';

class DetailAudioBookController extends GetxController {
  final isLoading = true.obs;
  final audioBookData = {}.obs;
  final network = Get.find<NetworkController>();

  final audioPosition = 0.0.obs;

  final audioDuration = Duration().obs;
  final currentAudioPosition = Duration().obs;
  final isPlay = false.obs;

  final player = AudioPlayer();

  Future<void> getDetailAudioBook() async {
    final uuid = Get.arguments['uuid'];
    try {
      dio.Response res = await network.get(
        '$baseUrl/2810aabc-9dc5-4d37-8ff1-fd579e9d6f0c/audio/?id=$uuid',
      );
      audioBookData.assignAll(res.data.first);
      setPlayer(audioBookData['path'].first['url']);
      isLoading.value = false;
    } on dio.DioException catch (e) {
      logKey('error getDetailAudioBook ${e.message}', e.response);
      isLoading.value = false;
    }
  }

  void initialFunction() async {
    await getDetailAudioBook();
  }

  void setPlayer(String audioUrl) async {
    await player.setUrl(
      // 'https://api.kontenbase.com/upload/file/storage/65a0e330fac3f5febba7f7f8/Things Fall Apart by Chinua Achebe Summary (Full Book in JUST 5 Minutes)-nqeJqtZU.mp3',
      audioUrl,
    );
    audioDuration.value = player.duration!;
  }

  void play() async {
    final maxDuration = player.duration!.inMilliseconds;
    player.durationStream.listen((event) {
      // logKey('durationStream', event);
      // audioPosition.value = event!.inSeconds.toDouble();
    });
    player.positionStream.listen((event) {
      // logKey('tes persen', event.inMilliseconds / maxDuration);
      currentAudioPosition.value = event;
      audioPosition.value = currentAudioPosition.value.inMilliseconds / maxDuration;
      // logKey('positionStream', event);
    });
    player.playerStateStream.listen((event) {
      isPlay.value = event.playing;
    });
    await player.play();
    // player.bufferedPosition;
  }

  void pause() {
    player.pause();
  }

  void seekPlay(double d) {
    final res = Duration(
      milliseconds: (d * audioDuration.value.inMilliseconds).round(),
    );
    player.seek(res);
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
    player.dispose();
  }
}
