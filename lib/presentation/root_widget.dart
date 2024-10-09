import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/app_logic.dart';
import 'package:shareinfo/domain/settings_logic.dart';
import 'package:shareinfo/infrastructure/auth/auth_info.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/infrastructure/env/env.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/presentation/core/register_cubit.dart';

import 'package:shareinfo/router/router.dart';
import 'package:shareinfo/style/styles.dart';
import 'package:shareinfo/style/theme.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});
  static AppStyle get style => _style;
  static AppStyle _style = AppStyle();
  @override
  Widget build(BuildContext context) {
    _style = AppStyle(screenSize: context.mq);
    return MultiBlocProvider(
      providers: [
        ...RegisterCubits().register(),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: Env.kDebugMode,
        title: 'ShareInfo',
        theme: AppTheme.fromType(ThemeType.shareInfoLight).themeData,
        routerConfig: appRouter,
      ),
    );
  }
}

AppStyle get $style => RootScreen.style;
final appRouter = AppRouter.router;
SettingsLogic get settingsLogic => getIt<SettingsLogic>();
AppLogic get appLogic => getIt<AppLogic>();
AuthInfo get auth => getIt<AuthInfo>();
TokenCubit get tokenCubit => getIt<TokenCubit>();
DioClient get dioClient => getIt<DioClient>();
