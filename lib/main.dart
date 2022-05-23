import 'package:flutter/material.dart';
import 'package:portfolio/main_container/main_container.dart';
import 'package:portfolio/theme/theme.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: PortfolioTheme.light(),
      home: const MainContainer(),
    );
  }
}
