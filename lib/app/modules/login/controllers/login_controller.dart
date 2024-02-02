import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:skeleton/app/controllers/network_controller.dart';
import 'package:skeleton/config/function_utils.dart';

import '../../../../config/environtment.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final network = Get.find<NetworkController>();

  void login() async {
    final isValidate = formKey.currentState!.saveAndValidate();
    if (!isValidate) {
      return;
    }
    logKey('form data', formKey.currentState!.value);
    // return;
    try {
      dio.Response res = await network.post(
        '$baseUrl/2810aabc-9dc5-4d37-8ff1-fd579e9d6f0c/auth/login',
        body: formKey.currentState!.value,
      );
      showToast('Login Success');
      Get.offNamed(
        Routes.HOME,
      );
    } on dio.DioException catch (e) {
      final res = jsonDecode(e.response.toString());
      showToast(
        jsonEncode(res['message']),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
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
