import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/page_sections/page_sections.dart';
import 'package:portfolio/widgets/widgets.dart';

class AppDevSection extends StatelessWidget {
  const AppDevSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionLayout(
      alignment: SectionAlignment.bodyRight,
      title: Text('Flutter is the way to go.'),
      subtitle: Text("A tech stack can't be that good. Right?"),
      body: Text(
        '''
In 2019, I was looking for a solution to build apps on multiple platforms using one code base for a startup project. When I discovered Flutter, it was love at first sight.

Ever since, I've been using the framework full-time to hone my skills, and have become a Google Developer Expert for Flutter & Dart.

In fact, this entire portfolio was built using 100% Flutter and Dart code. Feel free to check out the code here!
''',
      ),
      content: RoundedBox(
        fit: BoxFit.cover,
        child: ColoredBox(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: _AnimatedFlutterLogo(),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedFlutterLogo extends StatefulWidget {
  const _AnimatedFlutterLogo();

  @override
  State<_AnimatedFlutterLogo> createState() => __AnimatedFlutterLogoState();
}

class __AnimatedFlutterLogoState extends State<_AnimatedFlutterLogo> {
  late final Timer _animationTimer;

  var _showTitle = false;

  @override
  void initState() {
    super.initState();
    _animationTimer = Timer.periodic(
      const Duration(seconds: 4),
      (_) {
        if (mounted) {
          setState(() {
            _showTitle = !_showTitle;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _animationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogo(
      style: _showTitle ? FlutterLogoStyle.stacked : FlutterLogoStyle.markOnly,
      duration: const Duration(seconds: 1),
    );
  }
}
