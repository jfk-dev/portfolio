import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/main_container/main_container.dart';
import 'package:portfolio/theme/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JFK.DEV Portfolio',
      theme: PortfolioTheme.dark(),
      home: const MainContainer(),
    );
  }
}
