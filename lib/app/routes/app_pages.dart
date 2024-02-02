import 'package:get/get.dart';

import '../modules/boarding/bindings/boarding_binding.dart';
import '../modules/boarding/views/boarding_view.dart';
import '../modules/detail_audio_book/bindings/detail_audio_book_binding.dart';
import '../modules/detail_audio_book/views/detail_audio_book_view.dart';
import '../modules/detail_course/bindings/detail_course_binding.dart';
import '../modules/detail_course/views/detail_course_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list_audio_book/bindings/list_audio_book_binding.dart';
import '../modules/list_audio_book/views/list_audio_book_view.dart';
import '../modules/list_course/bindings/list_course_binding.dart';
import '../modules/list_course/views/list_course_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.BOARDING;
  static const INITIAL = Routes.BOARDING;
  // static const INITIAL = Routes.DETAIL_COURSE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOARDING,
      page: () => const BoardingView(),
      binding: BoardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 650),
    ),
    GetPage(
      name: _Paths.DETAIL_COURSE,
      page: () => const DetailCourseView(),
      binding: DetailCourseBinding(),
    ),
    GetPage(
      name: _Paths.LIST_COURSE,
      page: () => const ListCourseView(),
      binding: ListCourseBinding(),
    ),
    GetPage(
      name: _Paths.LIST_AUDIO_BOOK,
      page: () => const ListAudioBookView(),
      binding: ListAudioBookBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_AUDIO_BOOK,
      page: () => const DetailAudioBookView(),
      binding: DetailAudioBookBinding(),
    ),
  ];
}
