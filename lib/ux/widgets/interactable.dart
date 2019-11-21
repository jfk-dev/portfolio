import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jfkdev/utils/ux_utils.dart';
import 'package:jfkdev/ux/models/ux_models.dart';

/*
Unusable because of the following exception:

════════ Exception Caught By widgets library ═══════════════════════════════════
The following assertion was thrown building Interactable:
setState() or markNeedsBuild() called during build.

This JfkIconButton widget cannot be marked as needing to build because the framework is already in the process of building widgets. A widget can be marked as needing to be built during the build phase only if one of its ancestors is currently building. This exception is allowed because the framework builds parent widgets before children, which means a dirty descendant will always be built. Otherwise, the framework might not visit this widget during this build phase.
The widget on which setState() or markNeedsBuild() was called was:
  JfkIconButton(state: _JfkIconButtonState#a9f73)
The widget which was currently being built when the offending call was made was:
  Interactable
*/
class Interactable extends StatelessWidget {
  const Interactable({
    Key key,
    @required this.onInteractStart,
    @required this.onInteractEnd,
    this.onTap,
    @required this.child,
  }) : super(key: key);
  final VoidCallback onInteractStart;
  final VoidCallback onInteractEnd;
  final VoidCallback onTap;
  final Widget child;

  void _onInteractStart() {
    if (onTap != null) {
      setCursor(CursorType.pointer);
    }

    onInteractStart();
  }

  void _onInteractEnd() {
    if (onTap != null) {
      resetCursor();
    }
    onInteractEnd();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerEnter: (_) => _onInteractStart(),
      onPointerExit: (_) => _onInteractEnd(),
      child: child,
    );
  }
}
