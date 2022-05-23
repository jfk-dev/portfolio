import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageSections extends StatelessWidget {
  const PageSections({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView(
      controller: context.read<ScrollController>(),
      children: [
        for (final color in Colors.primaries)
          SizedBox.fromSize(
            size: size,
            child: ColoredBox(
              color: color.withOpacity(0.7),
              child: Center(
                child: Text('${Colors.primaries.indexOf(color) + 1}'),
              ),
            ),
          ),
      ],
    );
  }
}
