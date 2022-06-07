import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions/extensions.dart';
import 'package:portfolio/page_sections/page_sections.dart';
import 'package:provider/provider.dart';

enum SectionAlignment { left, right }

class SectionLayout extends StatelessWidget {
  const SectionLayout({
    super.key,
    this.alignment = SectionAlignment.left,
    required this.title,
    required this.body,
    required this.content,
  });

  final SectionAlignment alignment;
  final Widget title;
  final Widget body;
  final Widget content;

  static const _overallSpacing = 16.0;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isMobile = mediaQuery.size.width < 600;

    final pageIndex = context.select((PageSectionContext ctx) => ctx.pageIndex);

    final effectiveTitle = _SectionTitle(child: title);
    final effectiveBody = _SectionBody(child: body);
    final effectiveContent = _SectionContent(child: content);

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          effectiveTitle,
          const Gap(_overallSpacing),
          Expanded(
            child: effectiveBody,
          ),
          const Gap(_overallSpacing),
          effectiveContent,
        ],
      );
    } else {
      final leftSide = Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            effectiveTitle,
            const Gap(_overallSpacing),
            Expanded(
              child: effectiveBody,
            ),
          ],
        ),
      );
      final rightSide = Expanded(
        child: effectiveContent,
      );

      return Padding(
        padding: const EdgeInsets.all(_overallSpacing),
        child: Row(
          children: [
            if (alignment == SectionAlignment.left) leftSide else rightSide,
            const Gap(_overallSpacing * 2),
            if (alignment == SectionAlignment.left) rightSide else leftSide,
          ],
        ),
      );
    }

    return Column(
      children: [
        _SectionTitle(child: title),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final offsetT = context.clampedPageScrolls(
      offset: -0.7,
      multiplier: 2,
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

class _SectionBody extends StatelessWidget {
  const _SectionBody({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final offsetT = context.clampedPageScrolls(
      offset: -0.6,
      multiplier: 2,
    );

    return SlideAndFade(
      offsetT: offsetT,
      child: DefaultTextStyle.merge(
        style: Theme.of(context).textTheme.headlineSmall,
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
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.bodyLarge,
      child: child,
    );
  }
}

class SlideAndFade extends StatelessWidget {
  const SlideAndFade({
    super.key,
    this.startOffset = const Offset(0, -32),
    required this.offsetT,
    required this.child,
  });

  final Offset startOffset;
  final double offsetT;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final curvedOffset = Curves.easeInOut.transform(offsetT);

    return Opacity(
      opacity: offsetT,
      child: Transform.translate(
        offset: Offset.lerp(startOffset, Offset.zero, curvedOffset)!,
        child: child,
      ),
    );
  }
}
