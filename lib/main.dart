import 'package:flutter_web/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jfkdev/app_localization.dart';
import 'package:jfkdev/theme.dart';
import 'package:jfkdev/utils/utils.dart';
import 'package:jfkdev/ux/containers/main/main_container.dart';

void main() => runApp(JfkDevApp());

class JfkDevApp extends StatelessWidget {
  JfkDevApp() {
    final urlParameters = getCurrentUrl().queryParameters;
    final localeId = urlParameters['lang'] ?? getBrowserLanguage().split('-').first;
    GetIt.instance.registerSingleton<AppLocalization>(AppLocalization.fromLocaleId(localeId));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppLocalization.current.title,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      home: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: AppLocalization.instance.onChangeLocalization,
          builder: (context, _, __) {
            return MainContainer();
          },
        ),
      ),
    );
  }
}
