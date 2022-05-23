import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScrollProvider extends StatefulWidget {
  const ScrollProvider({
    super.key,
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  State<ScrollProvider> createState() => _ScrollProviderState();
}

class _ScrollProviderState extends State<ScrollProvider> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _scrollController,
      child: Builder(
        builder: widget.builder,
      ),
    );
  }
}
