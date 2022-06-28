import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/page_sections/page_sections.dart';
import 'package:portfolio/resources/custom_icons.dart';
import 'package:portfolio/widgets/widgets.dart';

class VgvSection extends StatelessWidget {
  const VgvSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionLayout(
      title: Text('Senior Engineer at Very Good Ventures.'),
      subtitle: Text(
        '🦄 Unicorns FTW.',
      ),
      body: Text(
        '''
Since 2020, I've been a remote developer at Very Good Ventures, a 100% Flutter app consultancy company from New York, USA.

At VGV, I've have the pleasure of solving loads of fun problems and got to work with a variety of technologies and companies.

In 2021, I became a Senior Engineer, which allowed me to teach and mentor others and work on large architectural app design challenges.

You can learn more about us and what we do over at vgv.dev''',
      ),
      content: RoundedBox(
        fit: BoxFit.cover,
        child: ColoredBox(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: _AnimatedVgvLogo(),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedVgvLogo extends StatefulWidget {
  const _AnimatedVgvLogo();

  @override
  State<_AnimatedVgvLogo> createState() => __AnimatedVgvLogoState();
}

class __AnimatedVgvLogoState extends State<_AnimatedVgvLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: sin(2 * pi * _animation.value) / 6,
          child: child,
        );
      },
      child: const Icon(
        CustomIcons.vgvUnicorn,
        color: Colors.black,
      ),
    );
  }
}
