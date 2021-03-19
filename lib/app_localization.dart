import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/models/config.dart';

class AppLocalization {
  AppLocalization._();

  static Localization fromLocaleId(String id) {
    return values.firstWhere(
      (locale) => locale.id == id,
      orElse: () => fallback,
    );
  }

  static const en = _LocalizationEn();
  static const nl = _LocalizationNl();
  static const ja = _LocalizationJa();

  static const fallback = en;

  static const values = <Localization>[
    en,
    nl,
    ja,
  ];

  static Localization get instance => GetIt.instance<Config>().localization;
}

@immutable
abstract class Localization {
  const Localization();

  String get id;
  String get name;
  String get fallbackName;
  String get icon;
  String get title => 'JFK.DEV';
  String get about => 'About';
  String get firstName => 'Jeroen';
  String get lastName => 'Meijer';
  String get nickName => 'Jay';
  String get commonName => nickName;
  String get greetingMorning => 'Good morning.';
  String get greetingAfternoon => 'Good afternoon.';
  String get greetingEvening => 'Good evening.';
  String get introductionPrefix => "I'm ";
  String get introductionSuffix => '.';

  String get highlightSoftwareDeveloperTitle => 'Software Developer';
  String get highlightSoftwareDeveloperDescription =>
      'Flutter, TypeScript and more.';

  String get highlightOpenSourceContributorTitle => 'Open Source Contributor';
  String get highlightOpenSourceContributorDescription =>
      'and Flutter Community administrator.';

  String get highlightSpeakerTitle => 'Speaker';
  String get highlightSpeakerDescription => 'Available for talks.';

  String get businessInfo => 'JFK.DEV ・ Rotterdam\nKVK: 74990241';

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) || other is Localization && id == other.id;
}

class _LocalizationEn extends Localization {
  const _LocalizationEn();

  @override
  String get id => 'en';
  @override
  String get name => 'English (US)';
  @override
  String get fallbackName => name;
  @override
  String get icon => '🇺🇸';
}

class _LocalizationNl extends Localization {
  const _LocalizationNl();

  @override
  String get id => 'nl';
  @override
  String get name => 'Nederlands';
  @override
  String get fallbackName => 'Dutch';
  @override
  String get icon => '🇳🇱';
  @override
  String get about => 'Over Mij';
  @override
  String get commonName => firstName;
  @override
  String get greetingMorning => 'Goedemorgen.';
  @override
  String get greetingAfternoon => 'Goedemiddag.';
  @override
  String get greetingEvening => 'Goedenavond.';
  @override
  String get introductionPrefix => 'Ik ben ';

  @override
  String get highlightSoftwareDeveloperTitle => 'Software Ontwikkelaar';
  @override
  String get highlightSoftwareDeveloperDescription =>
      'Flutter, TypeScript en meer.';

  @override
  String get highlightOpenSourceContributorTitle => 'Werkt Open Source';
  @override
  String get highlightOpenSourceContributorDescription =>
      'in de Flutter Community.';

  @override
  String get highlightSpeakerTitle => 'Spreker';
  @override
  String get highlightSpeakerDescription => 'Beschikbaar voor lectures.';
}

class _LocalizationJa extends Localization {
  const _LocalizationJa();

  @override
  String get id => 'ja';
  @override
  String get name => '日本語';
  @override
  String get fallbackName => 'Japanese';
  @override
  String get icon => '🇯🇵';
  @override
  String get about => '僕について';
  @override
  String get firstName => 'イェルン';
  @override
  String get lastName => 'マヤー';
  @override
  String get commonName => firstName;
  @override
  String get greetingMorning => 'おはよう。';
  @override
  String get greetingAfternoon => 'こんにちは。';
  @override
  String get greetingEvening => 'こんばんは。';
  @override
  String get introductionPrefix => '';
  @override
  String get introductionSuffix => 'です。';

  @override
  String get highlightSoftwareDeveloperTitle => 'ソフトウェア開発者';
  @override
  String get highlightSoftwareDeveloperDescription => 'Flutter、TypeScriptなど。';

  @override
  String get highlightOpenSourceContributorTitle => 'コミュニティの貢献者';
  @override
  String get highlightOpenSourceContributorDescription =>
      'Flutter Communityの代表です。';

  @override
  String get highlightSpeakerTitle => 'スピーカー';
  @override
  String get highlightSpeakerDescription => 'プログラミングについて説明します。';
}
