import 'package:flutter_web/material.dart';
import 'package:jfkdev/ux/sections/welcome/introduction_header.dart';
import 'package:jfkdev/ux/widgets/fill_screen.dart';
import 'package:jfkdev/ux/widgets/widget_utils.dart';

class WelcomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FillScreen(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              verticalMargin36,
              Flexible(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    child: IntroductionHeader(),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}
