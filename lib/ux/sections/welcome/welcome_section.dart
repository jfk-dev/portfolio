import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/theme.dart';
import 'package:portfolio/ux/app_icons.dart';
import 'package:portfolio/ux/sections/welcome/business_info.dart';
import 'package:portfolio/ux/sections/welcome/introduction_header.dart';
import 'package:portfolio/ux/sections/welcome/highlights_list.dart';
import 'package:portfolio/ux/sections/welcome/socials_row.dart';
import 'package:portfolio/ux/widgets/fill_screen.dart';
import 'package:portfolio/ux/widgets/wave/config.dart';
import 'package:portfolio/ux/widgets/wave/wave.dart';
import 'package:portfolio/ux/widgets/widget_utils.dart';

class WelcomeSection extends StatefulWidget {
  const WelcomeSection({
    Key? key,
    this.showDownArrow = true,
  }) : super(key: key);

  final bool showDownArrow;

  @override
  _WelcomeSectionState createState() => _WelcomeSectionState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('showDownArrow', showDownArrow));
  }
}

class _WelcomeSectionState extends State<WelcomeSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _baseAnimation;
  late final Animation<double> _headerAnimation;
  late final Animation<double> _wavesAnimation;
  late final Animation<double> _highlightsAnimation;
  late final Animation<double> _socialsAnimation;
  late final Animation<double> _businessInfoAnimation;
  late final Animation<double> _downArrowAnimation;

  @override
  void initState() {
    super.initState();
    _baseAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..forward();
    _wavesAnimation = CurvedAnimation(
      parent: _baseAnimation,
      curve: const Interval(0.3, 1.0),
    );
    _headerAnimation = CurvedAnimation(
      parent: _baseAnimation,
      curve: const Interval(0.0, 0.45),
    );
    _highlightsAnimation = CurvedAnimation(
      parent: _baseAnimation,
      curve: const Interval(0.42, 0.9),
    );
    _socialsAnimation = CurvedAnimation(
      parent: _baseAnimation,
      curve: const Interval(0.50, 1.0),
    );
    _businessInfoAnimation = CurvedAnimation(
      parent: _baseAnimation,
      curve: const Interval(0.70, 1.0),
    );
    _downArrowAnimation = CurvedAnimation(
      parent: _baseAnimation,
      curve: const Interval(0.75, 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FillScreen(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              verticalMargin32,
              Expanded(
                flex: 3,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    child: IntroductionHeader(animation: _headerAnimation),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Center(
                  child: HighlightsList(animation: _highlightsAnimation),
                ),
              ),
              Expanded(
                child: SocialsRow(animation: _socialsAnimation),
              ),
              Expanded(
                child: BusinessInfo(animation: _businessInfoAnimation),
              ),
              const Spacer(),
              Flexible(
                flex: 2,
                child: AnimatedBuilder(
                  animation: _wavesAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                          0.0,
                          250 -
                              (Curves.fastLinearToSlowEaseIn
                                      .transform(_wavesAnimation.value) *
                                  250)),
                      child: child,
                    );
                  },
                  child: WaveWidget(
                    config: WaveConfigCustom(
                      gradients: [
                        [AppTheme.colorBackgroundPrimary, Colors.blue],
                        [Colors.blue.shade800, Colors.blue.shade300],
                        [Colors.blue.shade900, AppTheme.colorBackgroundPrimary],
                        [
                          AppTheme.colorDefaultGradientOne,
                          AppTheme.colorDefaultGradientTwo
                        ],
                      ],
                      durations: [
                        35000,
                        19440,
                        10800,
                        6000,
                      ],
                      heightPercentages: [
                        0.20,
                        0.23,
                        0.25,
                        0.30,
                      ],
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(
              animation: _downArrowAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                      0.0,
                      -32 +
                          (AppTheme.animationCurveDefault
                                  .transform(_downArrowAnimation.value) *
                              32)),
                  child: Opacity(
                    opacity: AppTheme.animationCurveDefault
                        .transform(_downArrowAnimation.value),
                    child: child,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 350),
                  opacity: widget.showDownArrow ? 1.0 : 0.0,
                  child: const Icon(AppIcons.downOpen),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
