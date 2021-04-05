import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/app_localization.dart';
import 'package:portfolio/models/config.dart';
import 'package:portfolio/theme.dart';
import 'package:portfolio/ux/containers/main/main_container.dart';

Future<void> main() async {
  final config = await Config.parseYaml('config.yaml');

  runApp(JfkDevApp(config: config));
}

class JfkDevApp extends StatelessWidget {
  JfkDevApp({required Config config}) {
    GetIt.instance.registerSingleton<Config>(config);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppLocalization.instance.title,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      home: Scaffold(
        body: MainContainer(),
      ),
    );
  }
}
