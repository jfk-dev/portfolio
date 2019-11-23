import 'package:flutter/widgets.dart';

class AppImages {
  static AssetImage _asset(String path) => AssetImage('assets/images/$path');
  static NetworkImage _network(String url) => NetworkImage(url);

  static final logo = _asset('logo.png');
  static final profilePicture = _asset('profile_picture.png');
}
