import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/extensions/extensions.dart';
import 'package:portfolio/resources/custom_icons.dart';
import 'package:portfolio/resources/resources.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimatedSocialIcons extends StatelessWidget {
  const AnimatedSocialIcons({
    super.key,
  });

  /// At what percentage of one full page scroll the social icons should be
  /// placed at the bottom of the screen.
  static const _animationEndPoint = 0.5;

  /// The duration of all animations.
  static const _animationDuration = Duration(milliseconds: 500);

  /// The alignment of the icons when expanded.
  static const _expandedAlignment = Alignment(0, 0.3);

  /// The alignment of the icons when collapsed to the bottom.
  static const _collapsedAlignment = Alignment.bottomCenter;

  /// The width of the icons relative to the screen width when expanded.
  static const _expandedWidthPercentage = 0.6;

  /// The width of the icons relative to the screen width when collapsed to the
  /// bottom.
  static const _collapsedWidthPercentage = 0.75;

  /// The height of every icon when expanded.
  static const _expandedIconHeight = 35.0;

  /// The height of every icon when collapsed to the bottom.
  static const _collapsedIconHeight = 25.0;

  @override
  Widget build(BuildContext context) {
    final offsetT = context.clampedPageScrolls(
      multiplier: 1 / _animationEndPoint,
    );

    return AnimatedAlign(
      alignment: Alignment.lerp(
        _expandedAlignment,
        _collapsedAlignment,
        offsetT,
      )!,
      curve: Curves.fastLinearToSlowEaseIn,
      duration: _animationDuration,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: FractionallySizedBox(
          widthFactor: lerpDouble(
            _expandedWidthPercentage,
            _collapsedWidthPercentage,
            offsetT,
          ),
          child: IconTheme.merge(
            data: IconThemeData(
              size: lerpDouble(
                _expandedIconHeight,
                _collapsedIconHeight,
                offsetT,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                UrlButton(
                  url: Urls.twitter,
                  child: Icon(
                    FontAwesomeIcons.twitter,
                  ),
                ),
                UrlButton(
                  url: Urls.github,
                  child: Icon(
                    FontAwesomeIcons.github,
                  ),
                ),
                UrlButton(
                  url: Urls.email,
                  child: Icon(
                    FontAwesomeIcons.envelope,
                  ),
                ),
                UrlButton(
                  url: Urls.linkedIn,
                  child: Icon(
                    FontAwesomeIcons.linkedinIn,
                  ),
                ),
                UrlButton(
                  url: Urls.gde,
                  child: Icon(
                    FontAwesomeIcons.google,
                  ),
                ),
                UrlButton(
                  url: Urls.vgv,
                  child: Icon(
                    CustomIcons.vgvUnicorn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UrlButton extends StatelessWidget {
  const UrlButton({
    super.key,
    required this.url,
    required this.child,
  });

  final String url;
  final Widget child;

  Uri? get _uri => Uri.tryParse(url);
  bool get _isEnabled => _uri != null;

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      onTap: !_isEnabled ? null : () => launchUrl(_uri!),
      child: child,
    );
  }
}
