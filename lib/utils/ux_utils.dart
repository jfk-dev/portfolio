import 'dart:html' as html;
import 'dart:js' as js;

import 'package:flutter_web/animation.dart';
import 'package:jfkdev/app_localization.dart';
import 'package:jfkdev/theme.dart';
import 'package:jfkdev/utils/utils.dart';
import 'package:jfkdev/ux/models/ux_models.dart';
import 'package:meta/meta.dart';


// Functions
void setCursor(CursorType type) {
  (js.context['document'] as html.HtmlDocument).body.style.cursor = type.toString();
}

void resetCursor() => setCursor(CursorType.initial);

String getGreetingForCurrentTime() {
  final hour = DateTime.now().hour;
  if (isInBetween(hour, min: 6, max: 12)) {
    return AppLocalizations.instance.greetingMorning;
  } else if (isInBetween(hour, min: 12, max: 18)) {
    return AppLocalizations.instance.greetingAfternoon;
  } else {
    return AppLocalizations.instance.greetingEvening;
  }
}

List<Animation<double>> divideAnimationAlongItems<T>(
  List<T> items, {
  @required Animation<double> parent,
  double overlapStart = 0.0,
  double overlapEnd = 0.0,
  Curve curve = AppTheme.animationCurveDefault,
}) {
  assert(parent != null, 'Parent animation cannot be null.');
  assert(overlapStart >= 0.0 && overlapStart <= 1.0 && overlapEnd >= 0.0 && overlapEnd <= 1.0, 'Invalid overlap provided.');

  final max = items.length;
  final unit = 1.0 / max;

  final result = <Animation<double>>[];

  for (int i = 0; i < items.length; i++) {
    final relativeStart = i * unit;

    final start = valueBetween(relativeStart - overlapStart, min: 0.0);
    final end = valueBetween(relativeStart + unit + overlapEnd, max: 1.0);

    result.add(CurvedAnimation(
      parent: parent,
      curve: Interval(start, end, curve: curve),
    ));
  }

  return result;
}
