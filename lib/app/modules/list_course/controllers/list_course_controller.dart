// import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:skeleton/app/controllers/network_controller.dart';
import 'package:skeleton/app/routes/app_pages.dart';
import 'package:skeleton/config/environtment.dart';
import 'package:skeleton/config/function_utils.dart';

class ListCourseController extends GetxController {
  final network = Get.find<NetworkController>();

  final listCourses = [].obs;

  Future<void> getCourses() async {
    try {
      Response res = await network.get('$baseUrl/2810aabc-9dc5-4d37-8ff1-fd579e9d6f0c/courses');
      logKey('res getCourses', res.data);
      listCourses.addAll(res.data);
    } on DioException catch (e) {
      logKey('error getCourses ${e.error}', e.message);
    }
  }

  void toDetailCourse(String uuid) async {
    Get.toNamed(
      Routes.DETAIL_COURSE,
      arguments: {
        'uuid': uuid,
      },
    );
  }

  void initialFunction() async {
    getCourses();
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
