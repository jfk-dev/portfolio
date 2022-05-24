import 'dart:io';

import 'package:portfolio/resources/resources.dart';
import 'package:test/test.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.logo).existsSync(), true);
  });
}
