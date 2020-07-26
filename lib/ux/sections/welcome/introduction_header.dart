import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:jfkdev/app_localization.dart';
import 'package:jfkdev/theme.dart';
import 'package:jfkdev/utils/ux_utils.dart';
import 'package:jfkdev/ux/app_images.dart';
import 'package:jfkdev/ux/widgets/animatable.dart';

class IntroductionHeader extends AnimatableStatefulWidget {
  const IntroductionHeader({
    Key key,
    Animation<double> animation,
  }) : super(
          key: key,
          animation: animation,
        );

  @override
  _IntroductionHeaderState createState() => _IntroductionHeaderState();
}

class _IntroductionHeaderState extends AnimatableState<IntroductionHeader> {
  Animation<double> _titleAnimation;

  @override
  void initState() {
    super.initState();
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
        Padding(
          padding: const EdgeInsets.only(right: 32),
          child: CircleAvatar(
            radius: 164,
            backgroundColor: Colors.transparent,
            backgroundImage: AppImages.profilePicture,
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
                        (math.pi / 2) - (_titleAnimation.value * math.pi) / 2),
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
