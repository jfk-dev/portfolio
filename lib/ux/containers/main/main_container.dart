import 'package:flutter_web/material.dart';
import 'package:jfkdev/ux/sections/welcome/welcome_section.dart';

class MainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        WelcomeSection(),
      ],
    );
  }
}
