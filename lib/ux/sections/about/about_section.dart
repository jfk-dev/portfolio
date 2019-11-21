import 'package:flutter/material.dart';
import 'package:jfkdev/theme.dart';
import 'package:jfkdev/ux/widgets/fill_screen.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FillScreen(
      gradient: AppTheme.gradientDefault,
      child: Center(
        child: const Text('About'),
      ),
    );
  }
}
