import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ScaleButton extends StatefulWidget {
  const ScaleButton({
    super.key,
    this.scaleFactor = 0.9,
    this.hoverScaleFactor = 1.2,
    this.alignment = Alignment.center,
    this.curve = Curves.easeOut,
    this.duration = const Duration(milliseconds: 100),
    required this.onTap,
    required this.child,
  });

  final double scaleFactor;
  final double hoverScaleFactor;
  final Alignment alignment;
  final Curve curve;
  final Duration duration;
  final VoidCallback? onTap;
  final Widget child;

  @override
  State<ScaleButton> createState() => _ScaleButtonState();
}

class _ScaleButtonState extends State<ScaleButton> {
  bool get _isEnabled => widget.onTap != null;

  var _isHovering = false;
  var _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
  }

  void _onHover(PointerHoverEvent details) {
    setState(() {
      _isHovering = true;
    });
  }

  void _onExit(PointerExitEvent details) {
    setState(() {
      _isHovering = false;
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isEnabled) {
      return widget.child;
    }

    var scaleFactor = 1.0;
    if (_isPressed) {
      scaleFactor = widget.scaleFactor;
    } else if (_isHovering) {
      scaleFactor = widget.hoverScaleFactor;
    }

    return MouseRegion(
      onHover: _onHover,
      onExit: _onExit,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTap: widget.onTap,
        child: TweenAnimationBuilder<double>(
          tween: Tween(end: scaleFactor),
          curve: widget.curve,
          duration: widget.duration,
          builder: (context, scale, child) => Transform.scale(
            scale: scale,
            alignment: widget.alignment,
            child: child,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
