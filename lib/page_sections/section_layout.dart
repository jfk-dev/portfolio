import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions/extensions.dart';

enum SectionAlignment { bodyLeft, bodyRight }

class SectionLayout extends StatelessWidget {
  const SectionLayout({
    super.key,
    this.alignment = SectionAlignment.bodyLeft,
    required this.title,
    required this.subtitle,
    required this.body,
    this.content,
  });

  final SectionAlignment alignment;
  final Widget title;
  final Widget subtitle;
  final Widget body;
  final Widget? content;

  static const _overallSpacing = 16.0;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isMobile = mediaQuery.size.width < 700;

    final effectiveTitle = _SectionTitle(child: title);
    final effectiveSubtitle = _SectionSubtitle(child: subtitle);
    final effectiveBody = _SectionBody(child: body);
    final effectiveContent =
        content == null ? null : _SectionContent(child: content!);

    if (isMobile) {
      return Padding(
        padding: const EdgeInsets.all(_overallSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            effectiveTitle,
            const Gap(_overallSpacing),
            effectiveSubtitle,
            const Gap(_overallSpacing),
            effectiveBody,
            if (effectiveContent != null) ...[
              const Gap(_overallSpacing),
              Expanded(
                child: effectiveContent,
              ),
            ] else
              const Spacer(),
            const Gap(128),
          ],
        ),
      );
    } else {
      final leftSide = Expanded(
        child: effectiveBody,
      );
      final rightSide = effectiveContent == null
          ? null
          : Expanded(
              child: effectiveContent,
            );

      return Padding(
        padding: const EdgeInsets.all(_overallSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            effectiveTitle,
            const Gap(_overallSpacing),
            effectiveSubtitle,
            const Gap(_overallSpacing),
            if (rightSide == null)
              leftSide
            else
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (alignment == SectionAlignment.bodyLeft)
                      leftSide
                    else
                      rightSide,
                    const Gap(_overallSpacing * 2),
                    if (alignment == SectionAlignment.bodyLeft)
                      rightSide
                    else
                      leftSide,
                  ],
                ),
              ),
            const Gap(128),
          ],
        ),
      );
    }
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final offsetT = context.clampedPageScrolls(
      offset: -0.8,
      multiplier: 5,
    );

    return SlideAndFade(
      offsetT: offsetT,
      child: DefaultTextStyle.merge(
        style: Theme.of(context).textTheme.headlineLarge,
        child: child,
      ),
    );
  }
}

class _SectionSubtitle extends StatelessWidget {
  const _SectionSubtitle({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final offsetT = context.clampedPageScrolls(
      offset: -0.7,
      multiplier: 5,
    );

    return SlideAndFade(
      offsetT: offsetT,
      child: DefaultTextStyle.merge(
        style: Theme.of(context).textTheme.headlineMedium,
        child: child,
      ),
    );
  }
}

class _SectionBody extends StatelessWidget {
  const _SectionBody({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final offsetT = context.clampedPageScrolls(
      offset: -0.6,
      multiplier: 5,
    );

    return SlideAndFade(
      offsetT: offsetT,
      child: DefaultTextStyle.merge(
        style: Theme.of(context).textTheme.headlineSmall,
        overflow: TextOverflow.fade,
        child: child,
      ),
    );
  }
}

class _SectionContent extends StatelessWidget {
  const _SectionContent({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final offsetT = context.clampedPageScrolls(
      offset: -0.5,
      multiplier: 5,
    );

    final size = MediaQuery.of(context).size;

    return SlideAndFade(
      offsetT: offsetT,
      child: DefaultTextStyle.merge(
        style: Theme.of(context).textTheme.bodyLarge,
        child: SizedBox(
          width: double.infinity,
          height: min(700, size.height),
          child: child,
        ),
      ),
    );
  }
}

class SlideAndFade extends StatelessWidget {
  const SlideAndFade({
    super.key,
    this.startOffset = const Offset(0, -32),
    this.startScale = 0.95,
    required this.offsetT,
    required this.child,
  });

  final Offset startOffset;
  final double startScale;
  final double offsetT;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final curvedSlideOffset = Curves.easeInOut.transform(offsetT);
    final curvedScaleOffset = Curves.easeInOut.transform(offsetT);

    final currentScale = startScale + (1 - startScale) * curvedScaleOffset;

    return Opacity(
      opacity: offsetT,
      child: Transform.translate(
        offset: Offset.lerp(startOffset, Offset.zero, curvedSlideOffset)!,
        child: Transform.scale(
          scale: currentScale,
          child: child,
        ),
      ),
    );
  }
}
