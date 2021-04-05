import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:portfolio/app_localization.dart';
import 'package:portfolio/theme.dart';
import 'package:portfolio/utils/ux_utils.dart';
import 'package:portfolio/ux/app_images.dart';
import 'package:portfolio/ux/widgets/animatable.dart';

class IntroductionHeader extends AnimatableStatefulWidget {
  const IntroductionHeader({
    Key? key,
    Animation<double>? animation,
  }) : super(
          key: key,
          animation: animation,
        );

  @override
  _IntroductionHeaderState createState() => _IntroductionHeaderState();
}

class _IntroductionHeaderState extends AnimatableState<IntroductionHeader> {
  late final Animation<double> _iconAnimation;
  late final Animation<double> _titleAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimation = CurvedAnimation(
      parent: baseAnimation,
      curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
    );
    _titleAnimation = CurvedAnimation(
      parent: baseAnimation,
      curve: const Interval(0.15, 1.0, curve: AppTheme.animationCurveDefault),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedBuilder(
          animation: _iconAnimation,
          builder: (context, child) {
            return Opacity(
              // FIXME: Workaround for bug where image would clip and stutter.
              opacity: (_iconAnimation.value - 0.1).clamp(0.0, 1.0).toDouble(),
              child: child,
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 32),
            child: CircleAvatar(
              radius: 164,
              backgroundColor: Colors.transparent,
              backgroundImage: AppImages.profilePicture,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _titleAnimation,
          builder: (context, child) {
            return SizedBox(
              width: _titleAnimation.value * 550,
              child: FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(
                      (math.pi / 2) - (_titleAnimation.value * math.pi) / 2,
                    ),
                  child: Opacity(
                    opacity:
                        1, // valueBetween(_titleAnimation.value, max: 1.0),
                    child: child,
                  ),
                ),
              ),
            );
          },
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontFamily: AppTheme.fontFamilyDefault,
                color: AppTheme.colorTextSecondary,
                fontSize: 100,
              ),
              children: [
                TextSpan(text: '${getGreetingForCurrentTime()}\n'),
                TextSpan(text: AppLocalization.instance.introductionPrefix),
                TextSpan(
                  text: AppLocalization.instance.commonName,
                  style: const TextStyle(
                    color: AppTheme.colorTextPrimary,
                  ),
                ),
                TextSpan(text: AppLocalization.instance.introductionSuffix),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
