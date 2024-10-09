import 'package:envied/envied.dart';
import 'package:shareinfo/infrastructure/env/env.dart';
import 'package:shareinfo/infrastructure/env/env_keys.dart';

part 'prod_env.g.dart';

@Envied(name: 'Env', path: '.env.production')
final class ProductionEnv implements Env, EnvKeys {
  @override
  @EnviedField(varName: 'AZURE_STORAGE_URL', obfuscate: true)
  final String azureStorageUrl = _Env.azureStorageUrl;

  @override
  @EnviedField(varName: 'S_KEY_01', obfuscate: true)
  final String signingKey1 = _Env.signingKey1;
  @override
  @EnviedField(varName: 'S_KEY_02', obfuscate: true)
  final String signingKey2 = _Env.signingKey2;

  @override
  @EnviedField(varName: 'API_BASE_URL', obfuscate: true)
  final String apiBaseUrl = _Env.apiBaseUrl;

  @override
  @EnviedField(varName: 'SECRET_KEY_32', obfuscate: true)
  final String secretKey32 = _Env.secretKey32;

  @override
  @EnviedField(varName: 'SECRET_KEY_16', obfuscate: true)
  final String secretKey16 = _Env.secretKey16;

  @override
  @EnviedField(varName: 'DOMAIN_BASE_URL', obfuscate: true)
  final String domainBaseUrl = _Env.domainBaseUrl;

  @override
  @EnviedField(varName: 'SAS_TOKEN', obfuscate: true)
  final String sasToken = _Env.sasToken;
}
