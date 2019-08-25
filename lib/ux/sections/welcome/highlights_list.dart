import 'package:flutter_web/material.dart';
import 'package:jfkdev/app_localization.dart';
import 'package:jfkdev/theme.dart';
import 'package:jfkdev/utils/utils.dart';
import 'package:jfkdev/utils/ux_utils.dart';
import 'package:jfkdev/ux/app_icons.dart';
import 'package:jfkdev/ux/models/ux_models.dart';
import 'package:jfkdev/ux/widgets/animatable.dart';
import 'package:jfkdev/ux/widgets/highlight_card.dart';

class HighlightsList extends AnimatableStatefulWidget {
  const HighlightsList({
    Key key,
    Animation<double> animation,
  }) : super(
          key: key,
          animation: animation,
        );

  @override
  _HighlightsListState createState() => _HighlightsListState();
}

class _HighlightsListState extends AnimatableState<HighlightsList> {
  final welcomeScreenHighlights = <ContentViewModel>[
    ContentViewModel(
      icon: AppIcons.code,
      title: AppLocalizations.instance.highlightSoftwareDeveloperTitle,
      description: AppLocalizations.instance.highlightSoftwareDeveloperDescription,
    ),
    ContentViewModel(
      icon: AppIcons.heart,
      title: AppLocalizations.instance.highlightOpenSourceContributorTitle,
      description: AppLocalizations.instance.highlightOpenSourceContributorDescription,
    ),
    ContentViewModel(
      icon: AppIcons.chat,
      title: AppLocalizations.instance.highlightSpeakerTitle,
      description: AppLocalizations.instance.highlightSpeakerDescription,
    ),
  ];

  final _highlightAnimations = <Animation<double>>[];

  @override
  void initState() {
    super.initState();
    _highlightAnimations.addAll(divideAnimationAlongItems(
      welcomeScreenHighlights,
      parent: baseAnimation,
      overlapStart: 1.0,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
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
      ),
    );
  }
}
