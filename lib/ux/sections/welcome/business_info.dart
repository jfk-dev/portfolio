import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/app_localization.dart';
import 'package:portfolio/theme.dart';
import 'package:portfolio/ux/widgets/animatable.dart';

class BusinessInfo extends AnimatableStatefulWidget {
  const BusinessInfo({
    Key? key,
    Animation<double>? animation,
  }) : super(
          key: key,
          animation: animation,
        );

  @override
  _BusinessInfoState createState() => _BusinessInfoState();
}

class _BusinessInfoState extends AnimatableState<BusinessInfo> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: baseAnimation,
      builder: (context, child) {
        return Opacity(
          opacity:
              AppTheme.animationCurveDefault.transform(baseAnimation.value),
          child: child,
        );
      },
      child: SelectableText(
        AppLocalization.instance.businessInfo,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppTheme.colorTextSecondary,
        ),
      ),
    );
  }
}
