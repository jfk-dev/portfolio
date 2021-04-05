import 'package:flutter/material.dart';
import 'package:portfolio/theme.dart';
import 'package:portfolio/ux/models/ux_models.dart';
import 'package:portfolio/ux/widgets/jfk_card.dart';

class HighlightCard extends StatelessWidget {
  const HighlightCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ContentViewModel model;

  @override
  Widget build(BuildContext context) {
    return JfkCard(
      width: 350,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(model.icon, color: AppTheme.colorGreen),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (model.title != null)
                  Text(
                    model.title!,
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                if (model.description != null)
                  Text(
                    model.description!,
                    style: const TextStyle(
                      color: AppTheme.colorTextSecondary,
                      fontSize: 16.0,
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
