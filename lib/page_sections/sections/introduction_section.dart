import 'package:flutter/material.dart';
import 'package:portfolio/page_sections/page_sections.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:provider/provider.dart';

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final pageContext = context.watch<PageSectionContext>();

    // cspell:disable
    return const SectionLayout(
      title: const Text('Eiusmod ipsum voluptate ad duis sunt.'),
      body: const Text(
        // ignore: lines_longer_than_80_chars
        'Sunt dolore eu cillum amet esse proident. Ipsum in cupidatat aute ad. Commodo dolor anim ut irure eiusmod dolore eu et labore laboris. Cillum exercitation nisi sint ullamco excepteur ullamco ad id eiusmod exercitation occaecat anim exercitation non. Sit enim ad elit dolore sit sit. Occaecat fugiat excepteur adipisicing ex commodo id. Sit irure culpa est reprehenderit commodo nisi ad do sit ea enim. Qui dolor occaecat nulla aliqua reprehenderit ea sunt aliquip nulla. Ipsum anim non proident deserunt qui reprehenderit deserunt culpa consectetur ullamco commodo cupidatat mollit laborum.',
      ),
      content: ExampleImage(),
    );
  }
}
