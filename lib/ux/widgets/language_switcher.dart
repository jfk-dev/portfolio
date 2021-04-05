import 'package:flutter/material.dart';
import 'package:portfolio/app_localization.dart';
import 'package:portfolio/theme.dart';
import 'package:portfolio/utils/utils.dart';

class LanguageSwitcher extends StatefulWidget {
  @override
  _LanguageSwitcherState createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  static const _cardPadding =
      EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);

  bool _isCollapsed = true;

  Localization get currentLocalization => AppLocalization.instance;
  List<Localization> get selectableLanguages => AppLocalization.values
      .where((localization) => localization != currentLocalization)
      .toList();

  void _switch() {
    setState(() {
      _isCollapsed = !_isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: MaterialStateMouseCursor.clickable,
      child: AnimatedSwitcher(
        switchInCurve: AppTheme.animationCurveDefault,
        switchOutCurve: AppTheme.animationCurveDefault.flipped,
        layoutBuilder: (currentChild, previousChildren) {
          var children = previousChildren;
          if (currentChild != null) {
            children = children.toList()..add(currentChild);
          }
          return Stack(
            alignment: Alignment.topLeft,
            children: children,
          );
        },
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        duration: const Duration(milliseconds: 250),
        child: _isCollapsed
            ? _CollapsedView(
                localization: currentLocalization,
                padding: _cardPadding,
                onTap: _switch,
              )
            : _ExpandedView(
                selectedLocalization: currentLocalization,
                localizations: selectableLanguages,
                padding: _cardPadding,
                onTap: _switch,
              ),
      ),
    );
  }
}

class _CollapsedView extends StatelessWidget {
  const _CollapsedView({
    Key? key,
    required this.localization,
    this.padding = EdgeInsets.zero,
    required this.onTap,
  }) : super(key: key);

  final Localization localization;
  final EdgeInsets padding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: 0.6,
        child: Card(
          child: Padding(
            padding: padding,
            child: _LocalizationTile(
              localization: localization,
              showTitle: false,
            ),
          ),
        ),
      ),
    );
  }
}

class _ExpandedView extends StatelessWidget {
  const _ExpandedView({
    Key? key,
    required this.selectedLocalization,
    required this.localizations,
    this.padding = EdgeInsets.zero,
    required this.onTap,
  }) : super(key: key);

  final Localization selectedLocalization;
  final List<Localization> localizations;
  final EdgeInsets padding;
  final VoidCallback onTap;

  void _onSelectLocalization(Localization localization) {
    openUrl(
      getCurrentUrl().origin,
      queryParameters: {
        'lang': localization.id,
      },
      openInNewTab: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: onTap,
              child: _LocalizationTile(localization: selectedLocalization),
            ),
            for (final localization in localizations)
              GestureDetector(
                onTap: () => _onSelectLocalization(localization),
                child: _LocalizationTile(localization: localization),
              ),
          ],
        ),
      ),
    );
  }
}

class _LocalizationTile extends StatelessWidget {
  const _LocalizationTile({
    Key? key,
    required this.localization,
    this.showTitle = true,
  }) : super(key: key);

  final Localization localization;
  final bool showTitle;

  String get fallbackName => localization == AppLocalization.fallback
      ? ''
      : '(${localization.fallbackName})';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          localization.icon,
          style: const TextStyle(
            fontFamily: 'Arial',
          ),
        ),
        if (showTitle)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${localization.name} $fallbackName'),
          )
      ],
    );
  }
}
