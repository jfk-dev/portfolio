import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/page_sections/page_sections.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionLayout(
      alignment: SectionAlignment.bodyRight,
      title: Text('Get in touch!'),
      subtitle: Text('What are you waiting for? 😁'),
      body: Text(
        '''
If you want to know more about me, my skills, music, favorite dishes, whatever it might be -- do get in touch!

Use any of the buttons at the bottom of your screen to view my socials or send me an email. I hope to speak to you soon! 👋🏻
    ''',
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
