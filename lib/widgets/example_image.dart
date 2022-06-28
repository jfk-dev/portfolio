import 'package:flutter/material.dart';
import 'package:portfolio/widgets/widgets.dart';

class ExampleImage extends StatelessWidget {
  const ExampleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RoundedBox(
      child: Icon(
        Icons.image,
        color: Colors.black,
        size: 100,
      ),
    );
  }
}
