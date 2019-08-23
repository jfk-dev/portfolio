import 'package:flutter_web/material.dart';
import 'package:jfkdev/app_localization.dart';
import 'package:jfkdev/theme.dart';
import 'package:jfkdev/utils/utils.dart';
import 'package:jfkdev/ux/app_icons.dart';
import 'package:jfkdev/ux/models/ux_models.dart';
import 'package:jfkdev/ux/widgets/highlight_card.dart';
import 'package:jfkdev/ux/widgets/widget_utils.dart';

class HighlightsList extends StatefulWidget {
  const HighlightsList({
    Key key,
    this.animation,
  }) : super(key: key);

  final Animation<double> animation;

  @override
  _HighlightsListState createState() => _HighlightsListState();
}

class _HighlightsListState extends State<HighlightsList> {
  final welcomeScreenHighlights = <RichIconModel>[
    RichIconModel(
      icon: AppIcons.code,
      title: AppLocalizations.instance.highlightSoftwareDeveloperTitle,
      description: AppLocalizations.instance.highlightSoftwareDeveloperDescription,
    ),
    RichIconModel(
      icon: AppIcons.heart,
      title: AppLocalizations.instance.highlightOpenSourceContributorTitle,
      description: AppLocalizations.instance.highlightOpenSourceContributorDescription,
    ),
    RichIconModel(
      icon: AppIcons.chat,
      title: AppLocalizations.instance.highlightSpeakerTitle,
      description: AppLocalizations.instance.highlightSpeakerDescription,
    ),
  ];

  final _highlightAnimations = <Animation<double>>[];

  Animation<double> get _baseAnimation => widget.animation ?? stoppedAnimationEnd;

  Interval getAnimationInterval(int index) {
    final max = welcomeScreenHighlights.length;
    final unit = 1.0 / (max + 1);
    final relativeStart = index * unit;

    final start = relativeStart;
    final end = valueBetween(start + unit + 0.2, max: 1.0);

    return Interval(
      start,
      end,
      curve: AppTheme.animationCurveDefault,
    );
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < welcomeScreenHighlights.length; i++) {
      _highlightAnimations.add(CurvedAnimation(
        parent: _baseAnimation,
        curve: getAnimationInterval(i),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 16,
        spacing: 16,
        children: <Widget>[
          for (int i = 0; i < welcomeScreenHighlights.length; i++)
            AnimatedBuilder(
              animation: _highlightAnimations.elementAt(i),
              builder: (context, child) {
                final animation = _highlightAnimations.elementAt(i);
                return Transform.translate(
                  offset: Offset((animation.value * 100) - 100, 0.0),
                  child: Opacity(
                    opacity: animation.value,
                    child: child,
                  ),
                );
              },
              child: HighlightCard(model: welcomeScreenHighlights.elementAt(i)),
            )
        ],
      ),
    );
  }
}
