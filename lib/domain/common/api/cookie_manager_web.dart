// import 'package:dio/dio.dart';
// import 'package:cookie_jar/cookie_jar.dart';
// import 'dart:html' as html;

// class CookieManagerWeb extends Interceptor {
//   const CookieManagerWeb(this.cookieJar);

//   final CookieJar cookieJar;

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     final cookies = cookieJar.loadForRequest(options.uri);
//     cookies.then((cookies) {
//       final cookieString =
//           cookies.map((c) => '${c.name}=${c.value}').join('; ');
//       options.headers['cookie'] = cookieString;
//       handler.next(options);
//     }).catchError((dynamic e, StackTrace s) {
//       final err = DioException(
//         requestOptions: options,
//         error: e,
//         stackTrace: s,
//       );
//       handler.reject(err, true);
//     });
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     final setCookies = response.headers['set-cookie'];
//     if (setCookies != null) {
//       for (var cookie in setCookies) {
//         html.document.cookie = cookie;
//       }
//     }
//     handler.next(response);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     handler.next(err);
//   }
// }
