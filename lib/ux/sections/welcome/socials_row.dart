import 'package:flutter_web/material.dart';
import 'package:jfkdev/utils/utils.dart';
import 'package:jfkdev/utils/ux_utils.dart';
import 'package:jfkdev/ux/models/ux_data.dart';
import 'package:jfkdev/ux/widgets/animatable.dart';

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
  final _personSocialsAnimations = <Animation<double>>[];

  @override
  void initState() {
    super.initState();
    _personSocialsAnimations.addAll(divideAnimationAlongItems(
      personalSocialMediaData,
      parent: baseAnimation,
      overlapStart: 1.0,
      // overlapEnd: 0.5, //FIXME: Try out different parameters.
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO(jeroen-meijer): Add animatedbuilders.
    return IconButton(
      icon: Icon(personalSocialMediaData.first.icon),
      onPressed: () => openUrl(personalSocialMediaData.first.url),
    ); //FIXME: Implement properly.
  }
}
