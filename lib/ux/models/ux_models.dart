import 'package:flutter_web/widgets.dart';

class RichIconModel {
  const RichIconModel({
    this.title,
    this.description,
    this.icon,
  }) : assert(
          title != null || description != null || icon != null,
          'At least one field must be provided.',
        );

  final String title;
  final String description;
  final IconData icon;
}