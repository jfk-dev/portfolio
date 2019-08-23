import 'package:flutter_web/material.dart';

class FillScreen extends StatelessWidget {
  const FillScreen({
    Key key,
    this.color,
    @required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: color,
      child: child,
    );
  }
}
