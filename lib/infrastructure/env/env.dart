import 'package:shareinfo/infrastructure/env/dev_env.dart';
import 'package:shareinfo/infrastructure/env/env_keys.dart';
import 'package:shareinfo/infrastructure/env/prod_env.dart';

abstract interface class Env implements EnvKeys {
  static const kDebugMode = true;

  factory Env() => _instance;

  static final Env _instance = kDebugMode ? DevelopmentEnv() : ProductionEnv();
}
