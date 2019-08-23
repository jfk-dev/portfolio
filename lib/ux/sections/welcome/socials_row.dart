import 'package:flutter_web/material.dart';
import 'package:jfkdev/utils/utils.dart';
import 'package:jfkdev/utils/ux_utils.dart';
import 'package:jfkdev/ux/models/ux_data.dart';
import 'package:jfkdev/ux/widgets/animatable.dart';
import 'package:jfkdev/ux/widgets/jfk_icon_button.dart';

class SocialsRow extends AnimatableStatefulWidget {
  const SocialsRow({
    Key key,
    Animation<double> animation,
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
      // overlapEnd: 0.5, //FIXME: Try out different parameters.
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO(jeroen-meijer): Add animatedbuilders.
    return Row(
      children: <Widget>[
        JfkIconButton(
          model: personalSocialMediaData.first,
        ),
      ],
    );
  }
}
