import 'package:flutter_web/material.dart';
import 'package:jfkdev/ux/sections/about/about_section.dart';
import 'package:jfkdev/ux/sections/welcome/welcome_section.dart';

class MainContainer extends StatefulWidget {
  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  final ScrollController _scrollController = ScrollController();

  bool _showDownArrow = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.position.addListener(_onScrollPositionChanged);
    });
  }

  void _onScrollPositionChanged() {
    setState(() {
      _showDownArrow = _scrollController.offset.floor() == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        WelcomeSection(showDownArrow: _showDownArrow),
        AboutSection(),
      ],
    );
  }
}
