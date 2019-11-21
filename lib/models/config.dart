import 'package:get_it/get_it.dart';
import 'package:jfkdev/app_localization.dart';
import 'package:jfkdev/utils/utils.dart';
import 'package:meta/meta.dart';
import 'package:yaml/yaml.dart';

class Config {
  const Config._({
    @required this.localization,
  });

  static const fallback = Config._(
    localization: AppLocalization.fallback,
  );

  final Localization localization;

  static Config get instance => GetIt.instance<Config>();

  static Future<Config> parseYaml(String path) async {
    try {
      // final yamlFile = await readAsset(path);
      // final YamlMap yaml = loadYaml(yamlFile);

      // Use yaml for config.

      final url = getCurrentUrl();
      final preferredLocale = url.queryParameters['lang'] ?? getBrowserLanguage().split('-').first;

      return Config._(
        localization: AppLocalization.fromLocaleId(preferredLocale),
      );
    } on Exception catch (e) {
      log('YAML asset file "$path" not found or invalid. Using default config.\nException: $e');
      return fallback;
    }
  }
}