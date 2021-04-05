import 'dart:developer' as dev;
import 'dart:html' as html;
import 'dart:js' as js;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

void log(Object message) {
  if (kReleaseMode) {
    html.window.console.log(message);
  } else {
    dev.log('$message');
  }
}

Uri getCurrentUrl() {
  return Uri.parse(js.context['location']['href'] as String);
}

String getBrowserLanguage() {
  if (!js.context.hasProperty('navigator')) {
    throw Exception();
  }
  return js.context['navigator']['language'] as String? ??
      js.context['navigator']['userLanguage'] as String;
}

void openUrl(
  String url, {
  Map<String, dynamic>? queryParameters,
  bool openInNewTab = true,
}) {
  var serializedQuery = '';
  if (queryParameters?.isNotEmpty ?? false) {
    final parameters = queryParameters!.entries.fold<String>(
      '',
      (query, entry) {
        return '$query'
            '&${entry.key}='
            '${Uri.encodeComponent(entry.value.toString())}';
      },
    ).substring(1);

    serializedQuery = '?$parameters';
  }

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
