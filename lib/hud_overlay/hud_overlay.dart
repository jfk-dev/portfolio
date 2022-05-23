import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HudOverlay extends StatelessWidget {
  const HudOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ScrollController>();
    final offset = controller.offset;
    final size = MediaQuery.of(context).size;
    final fullPagesScrolled = controller.offset / size.height;

    return Center(
      child: Text(
        {
          'Offset': offset,
          'Full Pages Scrolled': fullPagesScrolled,
        }.entries.fold<String>(
              '',
              (acc, cur) => '$acc\n'
                  '${cur.key}: '
                  '${cur.value.toStringAsFixed(2).padLeft(6, '0')}',
            ),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
