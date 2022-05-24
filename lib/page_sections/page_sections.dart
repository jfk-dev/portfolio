import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageSections extends StatelessWidget {
  const PageSections({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final colors = List.filled(3, [Colors.white, Colors.grey]).expand((e) => e);

    return ListView(
      controller: context.read<ScrollController>(),
      children: [
        for (var i = 0; i < colors.length; i++)
          SizedBox.fromSize(
            size: size,
            child: ColoredBox(
              color: colors.elementAt(i),
              child: Center(
                child: Text('${i + 1}'),
              ),
            ),
          ),
      ],
    );
  }
}
