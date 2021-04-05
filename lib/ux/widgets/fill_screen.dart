import 'package:flutter/material.dart';

class FillScreen extends StatelessWidget {
  const FillScreen({
    Key? key,
    this.color,
    this.gradient,
    required this.child,
  })   : assert(
          color == null || gradient == null,
          'Either provide only a color or a gradient.',
        ),
        super(key: key);

  final Color? color;
  final Gradient? gradient;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
      ),
      child: child,
    );
  }
}
