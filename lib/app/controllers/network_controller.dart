import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:get/state_manager.dart';

class NetworkController extends GetxController {
  final Dio _dio = Dio();

  CookieJar cookieJar = CookieJar();

  Future<({bool isConnected, ConnectivityResult connectedVia})> checkConnection() async {
    _dio.options.connectTimeout = const Duration(milliseconds: 5000);
    final res = await Connectivity().checkConnectivity();
    if (res == ConnectivityResult.none) {
      return (isConnected: true, connectedVia: ConnectivityResult.none);
    }
    return (isConnected: true, connectedVia: res);
  }

  // final _headers = {};

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    bool isTest = false,
    String cookies = '',
  }) async {
    bool isConnect = false;
    if (isTest) {
      isConnect = true;
    } else {
      final res = await checkConnection();
      isConnect = res.isConnected;
    }
    if (!isConnect) {
      return;
    }
    try {
      // final a = GetStorage().read('cookies');
      Response res = await _dio.get(
        path,
        queryParameters: query,
        data: body,
        options: Options(
          headers: {"Cookie": cookies},
          contentType: 'application/json',
        ),
      );
      return res;
    } on DioException {
      rethrow;
    }
  }

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    bool isTest = false,
  }) async {
    bool isConnect = false;
    if (isTest) {
      isConnect = true;
    } else {
      final res = await checkConnection();
      isConnect = res.isConnected;
    }
    if (!isConnect) {
      return;
    }
    try {
      Response res = await _dio.post(
        path,
        queryParameters: query,
        data: body,
      );
      return res;
    } on DioException {
      rethrow;
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _dio.interceptors.add(CookieManager(cookieJar));
  }

  void increment() => count.value++;
}
