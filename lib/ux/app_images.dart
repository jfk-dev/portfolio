import 'package:flutter/widgets.dart';

// ignore: avoid_classes_with_only_static_members
class AppImages {
  static AssetImage _asset(String path) => AssetImage('assets/images/$path');
  // ignore: unused_element
  static NetworkImage _network(String url) => NetworkImage(url);

  static final logo = _asset('logo.png');
  static final profilePicture = _asset('profile_picture.png');
}
