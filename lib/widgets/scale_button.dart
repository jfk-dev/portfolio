import 'package:flutter/material.dart';

class ScaleButton extends StatefulWidget {
  const ScaleButton({
    super.key,
    this.scaleFactor = 0.9,
    this.alignment = Alignment.center,
    this.curve = Curves.easeOut,
    this.duration = const Duration(milliseconds: 100),
    required this.onTap,
    required this.child,
  });

  final double scaleFactor;
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
  bool _isPressed = false;

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

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: _isEnabled ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTapDown: _isEnabled ? _onTapDown : null,
        onTapUp: _isEnabled ? _onTapUp : null,
        onTap: _isEnabled ? widget.onTap : null,
        child: TweenAnimationBuilder<double>(
          tween: Tween(end: _isPressed ? widget.scaleFactor : 1.0),
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
