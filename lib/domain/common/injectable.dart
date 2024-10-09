import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/domain/common/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureInjection() async {
  init(getIt, environment: Environment.dev);
}
