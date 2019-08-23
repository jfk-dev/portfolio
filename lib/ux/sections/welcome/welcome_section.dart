import 'package:flutter_web/material.dart';
import 'package:jfkdev/theme.dart';
import 'package:jfkdev/ux/sections/welcome/introduction_header.dart';
import 'package:jfkdev/ux/widgets/fill_screen.dart';
import 'package:jfkdev/ux/widgets/wave/config.dart';
import 'package:jfkdev/ux/widgets/wave/wave.dart';
import 'package:jfkdev/ux/widgets/widget_utils.dart';

class WelcomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FillScreen(
      child: Column(
        children: <Widget>[
          verticalMargin32,
          FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64.0),
              child: IntroductionHeader(),
            ),
          ),
          Expanded(child: emptyWidget),
          Flexible(
            child: WaveWidget(
              config: WaveConfigCustom(
                gradients: [
                  [AppTheme.colorBackgroundLight, Colors.blue],
                  [Colors.blue[800], Colors.blue[300]],
                  [Colors.blue[900], AppTheme.colorBackgroundLight],
                  [Colors.cyan, AppTheme.colorGreen],
                ],
                durations: [
                  35000,
                  19440,
                  10800,
                  6000,
                ],
                heightPercentages: [
                  0.20,
                  0.23,
                  0.25,
                  0.30,
                ],
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
