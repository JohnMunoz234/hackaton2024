import 'package:flutter/foundation.dart';

enum Environment { qa, dev, prod }

class EnvConfig {
  static late Environment env;
  static late String baseUrl;

  static init() {
    baseUrl = const String.fromEnvironment("https://docusenseai-api.gse.com.co");
    String envName = const String.fromEnvironment("APP_CONFIG_ENV");
    if (envName.isEmpty) {
      envName = Environment.dev.name;
    }
    env = Environment.values.byName(envName);
    debugPrint("Starting with env $envName");
  }
}
