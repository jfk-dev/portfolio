import 'package:flutter_web/material.dart';
import 'package:jfkdev/theme.dart';

class JfkCard extends StatelessWidget {
  const JfkCard({
    Key key,
    @required this.width,
    @required this.height,
    @required this.child,
  }) : super(key: key);

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.colorBackgroundDark,
      width: width,
      height: height,
      child: child,
    );
  }
}
