import 'package:flutter_web/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jfkdev/app_localization.dart';
import 'package:jfkdev/theme.dart';
import 'package:jfkdev/utils/utils.dart';
import 'package:jfkdev/ux/containers/main/main_container.dart';

void main() => runApp(JfkDevApp());

class JfkDevApp extends StatelessWidget {
  JfkDevApp() {
    final urlParameters = getCurrentUrlParameters();
    final localeId = urlParameters['lang'] ?? getBrowserLanguage().split('-').first;
    GetIt.instance.registerSingleton<Localization>(AppLocalizations.fromLocaleId(localeId));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppLocalizations.instance.title,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      home: Scaffold(
        body: MainContainer(),
      ),
    );
  }
}
