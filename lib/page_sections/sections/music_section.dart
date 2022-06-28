import 'package:flutter/material.dart';
import 'package:portfolio/page_sections/page_sections.dart';
import 'package:portfolio/widgets/widgets.dart';

class MusicSection extends StatelessWidget {
  const MusicSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionLayout(
      alignment: SectionAlignment.bodyRight,
      title: const Text('Music and art'),
      subtitle: const Text('Aggressive passion turned into an obsession.'),
      body: const Text(
        '''
Coming from a family full of musicians, I've been inspired and making all sorts of sounds since I was a child.

In recent years, I've been producing electronic music under the name Flint & Figure. Alongside creating mostly Drum & Bass music, I've also delved into DJing, performing live and writing acoustic tunes.

With releases on multiple large labels and more tracks on the way, I'm slowly but surely creating a foothold in the DnB scene in Rotterdam.

I can't wait to expand my reach, write more tunes and see where the future leads me.''',
      ),
      content: RoundedBox(
        fit: BoxFit.cover,
        alignment: const Alignment(0, -0.3),
        child: Image.asset('assets/images/dj.gif'),
      ),
    );
  }
}
