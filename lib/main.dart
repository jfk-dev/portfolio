import 'package:flutter_web/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jfkdev/app_localization.dart';
import 'package:jfkdev/theme.dart';
import 'package:jfkdev/utils/utils.dart';
import 'package:jfkdev/ux/containers/main/main_container.dart';

void main() => runApp(JfkDev());

class JfkDev extends StatelessWidget {
  JfkDev() {
    final urlParameters = getCurrentUrlParameters();

    GetIt.instance.registerSingleton<Localization>(AppLocalizations.fromLocaleId(urlParameters['lang']));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppLocalizations.instance.title,
      theme: AppTheme.theme(),
      home: Scaffold(
        body: MainContainer(),
      ),
    );
  }
}
