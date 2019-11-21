import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jfkdev/app_localization.dart';
import 'package:jfkdev/models/config.dart';
import 'package:jfkdev/theme.dart';
import 'package:jfkdev/ux/containers/main/main_container.dart';

Future<void> main() async {
  final config = await Config.parseYaml('config.yaml');

  runApp(JfkDevApp(config: config));
}

class JfkDevApp extends StatelessWidget {
  JfkDevApp({Config config}) {
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
