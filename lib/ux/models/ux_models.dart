import 'package:flutter_web/widgets.dart';

class ContentViewModel {
  const ContentViewModel({
    this.title,
    this.description,
    this.icon,
    this.url,
  }) : assert(
          title != null || description != null || icon != null,
          'At least one field must be provided.',
        );

  final String title;
  final String description;
  final IconData icon;
  final String url;
}