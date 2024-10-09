import 'package:cookie_jar/cookie_jar.dart';
//import 'package:flutter/foundation.dart';
import 'package:shareinfo/domain/common/api/cookie_manager_io.dart';
// import 'package:shareinfo/domain/common/api/cookie_manager_web.dart';
//import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

class DioCookieManger {
  final _dio = Dio();
  final cookieJar = CookieJar();

  DioCookieManger() {
    _dio.options = BaseOptions(
      baseUrl: Env().apiBaseUrl,
      receiveTimeout: const Duration(seconds: 50),
      connectTimeout: const Duration(seconds: 50),
      sendTimeout: const Duration(seconds: 50),
    );
    _dio.interceptors.add(
        // kIsWeb ? CookieManagerWeb(cookieJar) :
        CookieManagerIo(cookieJar));
  }

  Dio get dio => _dio;
}
