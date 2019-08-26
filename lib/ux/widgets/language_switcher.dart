import 'package:flutter_web/material.dart';
import 'package:jfkdev/app_localization.dart';
import 'package:jfkdev/theme.dart';
import 'package:jfkdev/utils/ux_utils.dart';
import 'package:jfkdev/ux/models/ux_models.dart';

class LanguageSwitcher extends StatefulWidget {
  @override
  _LanguageSwitcherState createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  bool _isCollapsed = true;

  Localization get currentLocalization => AppLocalization.current;
  List<Localization> get selectableLanguages =>
      AppLocalization.values.where((localization) => localization != currentLocalization).toList();

  void _switch() {
    setState(() {
      _isCollapsed = !_isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerEnter: (_) => setCursor(CursorType.pointer),
      onPointerExit: (_) => resetCursor(),
      child: AnimatedSwitcher(
        switchInCurve: AppTheme.animationCurveDefault,
        switchOutCurve: AppTheme.animationCurveDefault.flipped,
        layoutBuilder: (currentChild, previousChildren) {
          List<Widget> children = previousChildren;
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
                onTap: _switch,
              )
            : _ExpandedView(
                selectedLocalization: currentLocalization,
                localizations: selectableLanguages,
                onTap: _switch,
              ),
      ),
    );
  }
}

class _CollapsedView extends StatelessWidget {
  const _CollapsedView({
    Key key,
    @required this.localization,
    @required this.onTap,
  }) : super(key: key);

  final Localization localization;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _LocalizationTile(
            localization: localization,
            showTitle: false,
          ),
        ),
      ),
    );
  }
}

class _ExpandedView extends StatelessWidget {
  const _ExpandedView({
    Key key,
    @required this.selectedLocalization,
    @required this.localizations,
    @required this.onTap,
  }) : super(key: key);

  final Localization selectedLocalization;
  final List<Localization> localizations;
  final VoidCallback onTap;

  void _onSelectLocalization(Localization localization) {
    onTap();
    AppLocalization.instance.localization = localization;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
    Key key,
    @required this.localization,
    this.showTitle = true,
  }) : super(key: key);

  final Localization localization;
  final bool showTitle;

  String get fallbackName => localization == AppLocalization.fallback ? '' : '(${localization.fallbackName})';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(localization.icon),
        if (showTitle)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${localization.name} $fallbackName'),
          )
      ],
    );
  }
}
