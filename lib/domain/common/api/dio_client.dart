import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/infrastructure/env/env.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
//import 'package:universal_html/html.dart';

enum DioMethodType { get, post, put, delete }

@Singleton()
class DioClient {
  late final Dio _dio = Dio();
  int refreshLimit = 0;

  late StreamSubscription tokenCubitSubscription;
  TokenCubit tokenCubit;
  DioClient(this.tokenCubit) {
    ///Assign base option values
    _dio.options = BaseOptions(
      baseUrl: Env().apiBaseUrl,
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          //window.console.clear();

          /// Check if tokens are valid before making the request
          if (!areTokensValid()) {
            /// Prevent the request if tokens are invalid
            refreshLimit = 0;
            return handler.reject(DioException(
              requestOptions: options,
              type: DioExceptionType.cancel,
              error: 'Tokens are invalid',
            ));
          }
          handler.next(options); // Continue with the request
        },
        onError: (e, handler) async {
          try {
            // window.console.clear();

            ///Handle Unauthorized exception
            if (!tokenCubit.state.isInitial && e.response?.statusCode == 401) {
              if (e.response != null) {
                refreshLimit++;
                final refreshToken = auth.authInfo.value.refreshToken ?? '';

                if (refreshLimit >= 100) {
                  auth.authInfo.value = auth.authInfo.value.copyWith(
                    refreshToken: null,
                    accessToken: null,
                  );
                  tokenCubit.clearAppData();

                  /// Exit the app or redirect to login
                  _handleExit();

                  ///Rejecting api in continuous 401 exception
                  return handler.reject(e);
                }
                final result = await tokenCubit.refreshToken(refreshToken);
                if (result != null) {
                  addToken(dio, tokenCubit.state);
                  final opts = Options(method: e.requestOptions.method);
                  final response = await _dio.request(
                    e.requestOptions.path,
                    options: opts,
                    cancelToken: e.requestOptions.cancelToken,
                    onReceiveProgress: e.requestOptions.onReceiveProgress,
                    data: e.requestOptions.data,
                    queryParameters: e.requestOptions.queryParameters,
                  );
                  handler.resolve(response);
                }
              }
            } else {
              handler.reject(e);
            }
          } catch (e) {
            return;
          }
        },
      ),
    );

    /// Add token header value at the beginning of app
    if (!tokenCubit.state.isInitial) {
      addToken(_dio, tokenCubit.state);
    }

    /// Listen token cubit and assign header value with corresponding TokenState
    tokenCubitSubscription = tokenCubit.stream.listen((event) {
      if (!event.isInitial) {
        addToken(_dio, tokenCubit.state);
      }
    });
  }

  Dio get dio => _dio;

  void dispose() {
    tokenCubitSubscription.cancel();
  }

  void addToken(Dio dio, TokenState state) {
    dio.options.headers.addAll(state.toAuthorizationHeader());
  }

  void _handleExit() {
    /// Implement your logic to exit the app or redirect to login
    /// For example, you can navigate to a login page
    appRouter.go(ScreenPath.login);
  }

  bool areTokensValid() {
    final refreshToken = auth.authInfo.value.refreshToken ?? '';
    final accessToken = auth.authInfo.value.accessToken ?? '';
    return refreshToken.isNotEmpty && accessToken.isNotEmpty;
  }
}
