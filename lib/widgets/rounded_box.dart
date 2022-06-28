import 'package:flutter/material.dart';

class RoundedBox extends StatelessWidget {
  const RoundedBox({
    super.key,
    this.maxHeight = 700,
    this.fit,
    this.alignment = Alignment.center,
    required this.child,
  });

  final double maxHeight;
  final BoxFit? fit;
  final Alignment alignment;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget effectiveChild = Center(child: child);
    if (fit != null) {
      effectiveChild = FittedBox(
        fit: fit!,
        alignment: alignment,
        child: child,
      );
    }

    const borderRadius = BorderRadius.all(Radius.circular(8));

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0x7FFFFFFF),
        borderRadius: borderRadius,
        // boxShadow: [
        //   BoxShadow(
        //     blurRadius: 1,
        //     spreadRadius: 1,
        //   ),
        // ],
      ),
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: borderRadius,
        child: effectiveChild,
      ),
    );
  }
}
