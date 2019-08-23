import 'dart:js' as js;

Map<String, String> getCurrentUrlParameters() {
  final uri = Uri.parse(js.context['location']['href']);
  return uri.queryParameters;
}

String getBrowserLanguage() {
  if (!js.context.hasProperty('navigator')) {
    return null;
  }
  return js.context['navigator']['language'] ?? js.context['navigator']['userLanguage'];
}

/// Indicates wether this value is in between [min] (inclusive) and [max] (exclusive).
bool isInBetween<T extends num>(T value, {T min, T max}) {
  if (min != null && value < min) {
    return false;
  }
  if (max != null && value >= max) {
    return false;
  }

  return true;
}

T valueBetween<T extends num>(T value, {T min, T max}) {
  if (min != null && value < min) {
    return min;
  } else if (max != null && value > max) {
    return max;
  } else {
    return value;
  }
}
