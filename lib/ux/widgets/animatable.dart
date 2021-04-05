import 'package:flutter/material.dart';
import 'package:portfolio/ux/widgets/widget_utils.dart';

abstract class AnimatableWidget extends StatelessWidget {
  const AnimatableWidget({
    Key? key,
    this.animation,
  }) : super(key: key);

  final Animation<double>? animation;

  Animation<double> get baseAnimation => animation ?? stoppedAnimationEnd;
}

abstract class AnimatableStatefulWidget extends StatefulWidget {
  const AnimatableStatefulWidget({
    Key? key,
    this.animation,
  }) : super(key: key);

  final Animation<double>? animation;

  @override
  AnimatableState<AnimatableStatefulWidget> createState();
}

abstract class AnimatableState<T extends AnimatableStatefulWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  Animation<double> get baseAnimation =>
      widget.animation ?? stoppedAnimationEnd;
}
