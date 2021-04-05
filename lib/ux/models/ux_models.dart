import 'package:flutter/widgets.dart';

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

  final String? title;
  final String? description;
  final IconData? icon;
  final String? url;
}

class CursorType {
  const CursorType._(this._value);

  final String _value;

  static const initial = CursorType._('initial');
  static const pointer = CursorType._('pointer');

  @override
  String toString() {
    return _value;
  }
}
