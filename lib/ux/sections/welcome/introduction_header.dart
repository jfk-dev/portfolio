import 'dart:math' as math;

import 'package:flutter_web/material.dart';
import 'package:jfkdev/app_localization.dart';
import 'package:jfkdev/theme.dart';
import 'package:jfkdev/utils/utils.dart';
import 'package:jfkdev/utils/ux_utils.dart';
import 'package:jfkdev/ux/widgets/widget_utils.dart';

class IntroductionHeader extends StatefulWidget {
  const IntroductionHeader({
    Key key,
    this.animation,
  }) : super(key: key);

  final Animation<double> animation;

  @override
  _IntroductionHeaderState createState() => _IntroductionHeaderState();
}

class _IntroductionHeaderState extends State<IntroductionHeader> with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  Animation<double> _titleAnimation;

  Animation<double> get _baseAnimation => widget.animation ?? stoppedAnimationEnd;

  @override
  void initState() {
    super.initState();
    _iconAnimation = CurvedAnimation(
      parent: _baseAnimation,
      curve: Interval(0.0, 0.6, curve: AppTheme.animationCurveDefault),
    );
    _titleAnimation = CurvedAnimation(
      parent: _baseAnimation,
      curve: Interval(0.4, 1.0, curve: AppTheme.animationCurveDefault),
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
            return FractionalTranslation(
              translation: Offset(0, 0.5 - (_iconAnimation.value * 0.5)),
              child: Opacity(
                opacity: valueBetween(_iconAnimation.value + 0.7, max: 1),
                child: child,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 32),
            child: CircleAvatar(
              backgroundColor: AppTheme.colorGreen,
              radius: 164,
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
                    ..rotateY((math.pi / 2) - (_titleAnimation.value * math.pi) / 2),
                  child: Opacity(
                    opacity: 1, // valueBetween(_titleAnimation.value, max: 1.0),
                    child: child,
                  ),
                ),
              ),
            );
          },
          child: Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: AppTheme.fontFamilyDefault,
                color: AppTheme.colorTextSecondary,
                fontSize: 100,
              ),
              children: [
                TextSpan(text: '${getGreetingForCurrentTime()}.\n'),
                TextSpan(text: '${AppLocalizations.instance.iAm} '),
                TextSpan(
                  text: AppLocalizations.instance.commonName,
                  style: TextStyle(
                    color: AppTheme.colorTextPrimary,
                  ),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
