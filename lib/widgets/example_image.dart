import 'package:flutter/material.dart';

class ExampleImage extends StatelessWidget {
  const ExampleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0x7FFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          maxHeight: 700,
        ),
        child: const Center(
          child: Icon(
            Icons.image,
            color: Colors.black,
            size: 100,
          ),
        ),
      ),
    );
  }
}
