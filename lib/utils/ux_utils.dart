import 'package:jfkdev/app_localization.dart';
import 'package:jfkdev/utils/utils.dart';

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