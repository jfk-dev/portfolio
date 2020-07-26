import 'package:flutter/material.dart';
import 'package:portfolio/theme.dart';
import 'package:portfolio/ux/widgets/fill_screen.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const FillScreen(
      gradient: AppTheme.gradientDefault,
      child: Center(
        child: Text('About'),
      ),
    );
  }
}
