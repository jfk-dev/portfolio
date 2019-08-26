import 'package:flutter_web/material.dart';
import 'package:jfkdev/ux/sections/about/about_section.dart';
import 'package:jfkdev/ux/sections/welcome/welcome_section.dart';
import 'package:jfkdev/ux/widgets/language_switcher.dart';

class MainContainer extends StatefulWidget {
  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  final ScrollController _scrollController = ScrollController();

  bool _isScrolledToTop = true;

  double get _amountOfPagesScrolled =>
      _scrollController.hasClients ? _scrollController.offset / MediaQuery.of(context).size.height : 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _scrollController.position.addListener(_onScrollPositionChanged);
    });
  }

  // void _onScrollPositionChanged() {
  //   if (_amountOfPagesScrolled == 0 && _isScrolledToTop == false) {
  //     setState(() {
  //       _isScrolledToTop = true;
  //     });
  //   } else if (_amountOfPagesScrolled != 0 && _isScrolledToTop == true) {
  //     setState(() {
  //       _isScrolledToTop = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          controller: _scrollController,
          // physics: const BouncingScrollPhysics(),
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            WelcomeSection(showDownArrow: false),
            // AboutSection(),
          ],
        ),
        Positioned(
          top: 16.0,
          left: 16.0,
          child: LanguageSwitcher(),
        ),
      ],
    );
  }
}
