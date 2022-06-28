/// Extensions on [DateTime] for convenience.
extension DateTimeExtensions on DateTime {
  /// Returns the floored absolute difference in years between this date and
  /// the [other].
  int differenceInYears(DateTime other) {
    var diff = other.year - year;

    if (month > other.month) {
      diff--;
    } else if (other.month == month && day > other.day) {
      diff--;
    }

    return diff;
  }
}
