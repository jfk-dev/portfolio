import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/ux/models/ux_models.dart';

class JfkIconButton extends StatefulWidget {
  const JfkIconButton({
    Key? key,
    required this.model,
    this.size,
    this.color = Colors.white,
    this.onTap,
  }) : super(key: key);

  final ContentViewModel model;
  final double? size;
  final Color color;
  final VoidCallback? onTap;

  @override
  _JfkIconButtonState createState() => _JfkIconButtonState();
}

class _JfkIconButtonState extends State<JfkIconButton> {
  bool _isHovering = false;

  void _onTap() {
    if (widget.onTap != null) {
      widget.onTap!();
      return;
    }

    if (widget.model.url != null) {
      openUrl(widget.model.url!);
    }
  }

  void _onPointerEnter(PointerEnterEvent event) {
    setState(() {
      _isHovering = true;
    });
  }

  void _onPointerExit(PointerExitEvent event) {
    setState(() {
      _isHovering = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: MaterialStateMouseCursor.clickable,
      onEnter: _onPointerEnter,
      onExit: _onPointerExit,
      child: GestureDetector(
        onTap: _onTap,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: _isHovering ? 1.0 : 0.4,
          child: Icon(
            widget.model.icon,
            size: widget.size,
            color: widget.color,
          ),
        ),
      ),
    );
  }
}
