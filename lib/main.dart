import 'package:flutter/material.dart';
import 'package:shareinfo/domain/common/injectable.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';
//import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Configuring injection
  await configureInjection();

  // Removing '#' in url path
  // if (!Env.kDebugMode) setPathUrlStrategy();

  runApp(const RootScreen());

  // Bootstrap loading
  await appLogic.bootstrap();
}
