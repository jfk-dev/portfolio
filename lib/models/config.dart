// import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:jfkdev/app_localization.dart';
import 'package:jfkdev/utils/utils.dart';
import 'package:meta/meta.dart';
import 'package:yaml/yaml.dart';

class Config {
  const Config._({
    @required this.localization,
    @required this.redirects,
  });

  static const _default = Config._(
    localization: AppLocalization.fallback,
    redirects: [],
  );

  final Localization localization;
  final List<Redirect> redirects;

  static Config get instance => GetIt.instance<Config>();

  static Future<Config> parseYaml(String path) async {
    try {
      final yamlFile = await readAsset(path);
      final YamlMap yaml = loadYaml(yamlFile);

      final redirects = Redirect.fromYamlMap(yaml['redirects']);

      final url = getCurrentUrl();
      final preferredLocale = url.queryParameters['lang'] ?? getBrowserLanguage().split('-').first;


      return Config._(
        localization: AppLocalization.fromLocaleId(preferredLocale),
        redirects: redirects,
      );
    } on Exception catch (e) {
      log('YAML asset file "$path" not found or invalid. Using default config.\nException: $e');
      return _default;
    }
  }
}

class Redirect {
  const Redirect._({
    @required this.keyword,
    @required this.url,
  });

  static List<Redirect> fromYamlMap(YamlMap list) {
    return list.entries.map((entry) {
      return Redirect._(
        keyword: entry.key,
        url: entry.value,
      );
    }).toList();
  }

  final String keyword;
  final String url;
}
