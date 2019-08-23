import 'package:flutter_web/widgets.dart';

class AppImages {
  static AssetImage _asset(String path) => AssetImage('images/$path');
  static NetworkImage _network(String url) => NetworkImage(url);

  static final logo = _asset('logo.png');
  static final profilePicture = _network('https://avatars3.githubusercontent.com/u/14292245?s=400&v=4');
}
