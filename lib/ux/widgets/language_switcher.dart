import 'package:flutter_web/material.dart';
import 'package:jfkdev/app_localization.dart';

class LanguageSwitcher extends StatefulWidget {
  @override
  _LanguageSwitcherState createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  Localization get currentLocalization => AppLocalizations.instance;
  List<Localization> get selectableLanguages =>
      AppLocalizations.values.where((localization) => localization != currentLocalization);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // TODO: Implement.
      ],
    );
  }
}
