import 'package:flutter_web/widgets.dart';

class TalentCardModel {
  const TalentCardModel({
    this.title,
    this.content,
    this.icon,
  }) : assert(
          title != null || content != null || icon != null,
          'At least one field must be provided.',
        );

  final String title;
  final String content;
  final IconData icon;
}
