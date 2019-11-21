import 'package:flutter/material.dart';
import 'package:jfkdev/theme.dart';
import 'package:jfkdev/ux/sections/welcome/welcome_section.dart';
import 'package:jfkdev/ux/widgets/language_switcher.dart';

class MainContainer extends StatefulWidget {
  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  AnimationController _overlayAnimation;
  Animation<double> _languageSwitcherAnimation;

  // bool _isScrolledToTop = true;

  // double get _amountOfPagesScrolled =>
  //     _scrollController.hasClients ? _scrollController.offset / MediaQuery.of(context).size.height : 0;

  @override
  void initState() {
    super.initState();
    _overlayAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..forward();
    _languageSwitcherAnimation = CurvedAnimation(
      parent: _overlayAnimation,
      curve: const Interval(0.65, 1.0, curve: AppTheme.animationCurveDefault),
    );
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _scrollController.position.addListener(_onScrollPositionChanged);
    // });
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
          top: 10.0,
          left: 10.0,
          child: AnimatedBuilder(
            animation: _overlayAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _languageSwitcherAnimation.value,
                child: child,
              );
            },
            child: LanguageSwitcher(),
          ),
        ),
      ],
    );
  }
}
