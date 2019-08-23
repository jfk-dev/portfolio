import 'package:flutter_web/material.dart';
import 'package:jfkdev/theme.dart';
import 'package:jfkdev/utils/utils.dart';
import 'package:jfkdev/ux/app_icons.dart';
import 'package:jfkdev/ux/models/ux_models.dart';
import 'package:jfkdev/ux/widgets/talent_card.dart';
import 'package:jfkdev/ux/widgets/widget_utils.dart';

class TalentsList extends StatefulWidget {
  const TalentsList({
    Key key,
    this.animation,
  }) : super(key: key);

  final Animation<double> animation;

  @override
  _TalentsListState createState() => _TalentsListState();
}

class _TalentsListState extends State<TalentsList> {
  static const _talents = <TalentCardModel>[
    TalentCardModel(
      title: 'Software Developer',
      icon: AppIcons.code,
    ),
    TalentCardModel(
      title: 'Flutter Community Admin',
      icon: AppIcons.heart,
    ),
    TalentCardModel(
      title: 'Musician',
      icon: AppIcons.note,
    ),
  ];

  final _talentAnimations = <Animation<double>>[];

  Animation<double> get _baseAnimation => widget.animation ?? stoppedAnimationEnd;

  Interval getAnimationInterval(int index) {
    final max = _talents.length;
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
    for (int i = 0; i < _talents.length; i++) {
      _talentAnimations.add(CurvedAnimation(
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
          for (int i = 0; i < _talents.length; i++)
            AnimatedBuilder(
              animation: _talentAnimations.elementAt(i),
              builder: (context, child) {
                final animation = _talentAnimations.elementAt(i);
                return Transform.translate(
                  offset: Offset((animation.value * 100) - 100, 0.0),
                  child: Opacity(
                    opacity: animation.value,
                    child: child,
                  ),
                );
              },
              child: TalentCard(model: _talents.elementAt(i)),
            )
        ],
      ),
    );
  }
}
