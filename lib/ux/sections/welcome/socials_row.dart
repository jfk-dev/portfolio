import 'package:flutter/material.dart';
import 'package:portfolio/utils/ux_utils.dart';
import 'package:portfolio/ux/models/ux_data.dart';
import 'package:portfolio/ux/widgets/animatable.dart';
import 'package:portfolio/ux/widgets/jfk_icon_button.dart';

class SocialsRow extends AnimatableStatefulWidget {
  const SocialsRow({
    Key? key,
    Animation<double>? animation,
  }) : super(
          key: key,
          animation: animation,
        );

  @override
  _SocialsRowState createState() => _SocialsRowState();
}

class _SocialsRowState extends AnimatableState<SocialsRow> {
  final _personalSocialsAnimations = <Animation<double>>[];

  @override
  void initState() {
    super.initState();
    _personalSocialsAnimations.addAll(divideAnimationAlongItems(
      personalSocialMediaData,
      parent: baseAnimation,
      overlapStart: 1.0,
      // overlapEnd: 1.0,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (int i = 0; i < personalSocialMediaData.length; i++)
          AnimatedBuilder(
            animation: _personalSocialsAnimations.elementAt(i),
            builder: (context, child) {
              final animation = _personalSocialsAnimations.elementAt(i);
              return Transform.translate(
                offset: Offset(0.0, 150 - (animation.value * 150)),
                child: Opacity(
                  opacity: animation.value,
                  child: child,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: JfkIconButton(
                size: 32.0,
                model: personalSocialMediaData.elementAt(i),
              ),
            ),
          )
      ],
    );
  }
}
