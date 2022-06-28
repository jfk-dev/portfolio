import 'package:flutter/material.dart';
import 'package:portfolio/extensions/extensions.dart';
import 'package:portfolio/page_sections/page_sections.dart';
import 'package:portfolio/widgets/widgets.dart';
// import 'package:provider/provider.dart';

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    // final pageContext = context.watch<PageSectionContext>();

    final currentDate = DateTime.now();

    final birthDate = DateTime(1998, 07, 20);
    final age = birthDate.differenceInYears(currentDate);

    final startDateDev = DateTime(2019, 06);
    final yearsDevelopingApps = startDateDev.differenceInYears(currentDate);

    return SectionLayout(
      title: const Text("Hi! 👋🏻 I'm Jay."),
      subtitle: Text(
        'A $age year old software developer in love with music, '
        'technology and Japan.',
      ),
      body: Text(
        '''
Fascinated by computers since I was 8 years old, I've been studying and experimenting with all kinds of devices for as long as I can remember.

I have a passion for creating experiences that enrich people's lives, or simply makes somebody's day a bit better. I've been doing so as an app developer for more than $yearsDevelopingApps years.''',
      ),
      content: RoundedBox(
        fit: BoxFit.cover,
        child: Image.asset('assets/images/jay1.jpeg'),
      ),
    );
  }
}
