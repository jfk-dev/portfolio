import 'package:flutter_web/material.dart';
import 'package:jfkdev/theme.dart';

class JfkCard extends StatelessWidget {
  const JfkCard({
    Key key,
    @required this.width,
    @required this.height,
    @required this.child,
    this.onPointerEnter,
    this.onPointerExit,
    this.onTap,
  }) : super(key: key);

  final double width;
  final double height;
  final VoidCallback onPointerEnter;
  final VoidCallback onPointerExit;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (isHovering) => isHovering ? onPointerEnter?.call() : onPointerExit?.call(),
      onTap: onTap,
      child: Container(
        color: AppTheme.colorBackgroundDark,
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
