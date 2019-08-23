import 'package:flutter_web/material.dart';
import 'package:jfkdev/ux/models/ux_models.dart';
import 'package:jfkdev/ux/widgets/jfk_card.dart';

class TalentCard extends StatelessWidget {
  const TalentCard({
    Key key,
    @required this.model,
  }) : super(key: key);

  const TalentCard.compact({
    Key key,
    @required this.model,
  }) : super(key: key);

  final TalentCardModel model;

  @override
  Widget build(BuildContext context) {
    return JfkCard(
      width: 350,
      height: 100,
      child: Row(
        children: <Widget>[
          Text(model.title),
        ],
      ),
    );
  }
}
