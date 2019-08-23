import 'package:get_it/get_it.dart';

class AppLocalizations {
  const AppLocalizations._();

  static const en = LocalizationEn();
  static const nl = LocalizationNl();

  static const fallback = en;

  static const values = <Localization>[
    en,
    nl,
  ];

  static Localization get instance => GetIt.instance<Localization>();

  static Localization fromLocaleId(String id) => values.firstWhere(
        (locale) => locale.id == id,
        orElse: () => fallback,
      );
}

abstract class Localization {
  const Localization();

  String get id;
  String get title => 'JFK.DEV';
  String get about => 'About';
  String get firstName => 'Jeroen';
  String get lastName => 'Meijer';
  String get nickName => 'Jay';
  String get commonName => nickName;
  String get greetingMorning => 'Good morning';
  String get greetingAfternoon => 'Good afternoon';
  String get greetingEvening => 'Good evening';
  String get iAm => "I'm";
  String get introduction => '$iAm $commonName';
}

class LocalizationEn extends Localization {
  const LocalizationEn();

  @override
  String get id => 'en';
}

class LocalizationNl extends Localization {
  const LocalizationNl();

  @override
  String get id => 'nl';
  @override
  String get about => 'Over Mij';
  @override
  String get commonName => firstName;
  @override
  String get greetingMorning => 'Goedemorgen';
  @override
  String get greetingAfternoon => 'Goedemiddag';
  @override
  String get greetingEvening => 'Goedenavond';
  @override
  String get iAm => 'Ik ben';
}
