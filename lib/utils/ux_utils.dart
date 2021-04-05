import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/app_localization.dart';
import 'package:portfolio/theme.dart';

// Functions
String getGreetingForCurrentTime() {
  final hour = DateTime.now().hour;
  if (hour.clamp(6, 12) == hour) {
    return AppLocalization.instance.greetingMorning;
  } else if (hour.clamp(12, 18) == hour) {
    return AppLocalization.instance.greetingAfternoon;
  } else {
    return AppLocalization.instance.greetingEvening;
  }
}

List<Animation<double>> divideAnimationAlongItems<T>(
  List<T> items, {
  required Animation<double> parent,
  double overlapStart = 0.0,
  double overlapEnd = 0.0,
  Curve curve = AppTheme.animationCurveDefault,
}) {
  assert(
    overlapStart >= 0.0 &&
        overlapStart <= 1.0 &&
        overlapEnd >= 0.0 &&
        overlapEnd <= 1.0,
    'Invalid overlap provided.',
  );

  final max = items.length;
  final unit = 1.0 / max;

  final result = <Animation<double>>[];

  for (var i = 0; i < items.length; i++) {
    final relativeStart = i * unit;

    final start =
        (relativeStart - overlapStart).clamp(0.0, double.maxFinite).toDouble();
    final end = (relativeStart + unit + overlapEnd)
        .clamp(double.minPositive, 1.0)
        .toDouble();

    result.add(CurvedAnimation(
      parent: parent,
      curve: Interval(start, end, curve: curve),
    ));
  }

  return result;
}
