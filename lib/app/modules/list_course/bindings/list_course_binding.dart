import 'package:get/get.dart';

import '../controllers/list_course_controller.dart';

class ListCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListCourseController>(
      () => ListCourseController(),
    );
  }
}
