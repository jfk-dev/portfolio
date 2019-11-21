import 'dart:html' as html;
import 'dart:js' as js;

import 'package:flutter/services.dart' show rootBundle;

void log(dynamic message) {
  html.window.console.log(message);
}

Uri getCurrentUrl() {
  return Uri.parse(js.context['location']['href']);
}

String getBrowserLanguage() {
  if (!js.context.hasProperty('navigator')) {
    return null;
  }
  return js.context['navigator']['language'] ?? js.context['navigator']['userLanguage'];
}

void openUrl(
  String url, {
  Map<String, dynamic> queryParameters,
  bool openInNewTab = true,
}) {
  final serializedQuery = (queryParameters == null || queryParameters.isEmpty)
      ? ''
      : '?' +
          queryParameters.entries.fold<String>('', (query, entry) {
            return query + '&${entry.key}=' + Uri.encodeComponent(entry.value.toString());
          }).substring(1);

  final fullUrl = '$url$serializedQuery';

  if (openInNewTab) {
    js.context.callMethod('open', [fullUrl]);
  } else {
    js.context.callMethod('open', [fullUrl, '_self']);
  }
}

Future<String> readAsset(String path) async {
  return rootBundle.loadString(path);
}

// String getRedirects() {}

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
