import 'package:flutter/material.dart';

class ExampleImage extends StatelessWidget {
  const ExampleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0x7FFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Center(
        child: Icon(
          Icons.image,
          color: Colors.black,
          size: 100,
        ),
      ),
    );
  }
}
