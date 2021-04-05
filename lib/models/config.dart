import 'package:get_it/get_it.dart';
import 'package:portfolio/app_localization.dart';
import 'package:portfolio/utils/utils.dart';

class Config {
  const Config._({
    required this.localization,
  });

  static const fallback = Config._(
    localization: AppLocalization.fallback,
  );

  final Localization localization;

  static Config get instance => GetIt.instance<Config>();

  static Future<Config> parseYaml(String path) async {
    try {
      final url = getCurrentUrl();
      final preferredLocale =
          url.queryParameters['lang'] ?? getBrowserLanguage().split('-').first;

      return Config._(
        localization: AppLocalization.fromLocaleId(preferredLocale),
      );
    } on Exception catch (e) {
      log(
        'YAML asset file "$path" not found or invalid. '
        'Using default config.\n'
        'Exception: $e',
      );
      return fallback;
    }
  }
}
