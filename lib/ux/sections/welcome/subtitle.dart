// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:jfkdev/app_localization.dart';
// import 'package:jfkdev/theme.dart';
// import 'package:jfkdev/ux/widgets/animatable.dart';

// class Subtitle extends AnimatableStatefulWidget {
//   const Subtitle({
//     Key key,
//     Animation<double> animation,
//   }) : super(
//           key: key,
//           animation: animation,
//         );

//   @override
//   _SubtitleState createState() => _SubtitleState();
// }

// class _SubtitleState extends AnimatableState<Subtitle> {
//   Timer _subtitleTimer;
//   int _subtitleIndex = 0;

//   List<String> get _subtitles => AppLocalization.instance.subtitles;
//   String get _currentSubtitle => _subtitles.elementAt(_subtitleIndex);

//   @override
//   void initState() {
//     super.initState();
//     _subtitleTimer = Timer.periodic(const Duration(milliseconds: 3000), (_) => _nextSubtitle());
//   }

//   @override
//   void dispose() {
//     _subtitleTimer.cancel();
//     super.dispose();
//   }

//   void _nextSubtitle() {
//     setState(() {
//       _subtitleIndex++;
//       if (_subtitleIndex >= _subtitles.length) {
//         _subtitleIndex = 0;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: baseAnimation,
//       builder: (context, child) {
//         return Opacity(
//           opacity: baseAnimation.value,
//           child: child,
//         );
//       },
//       child: AnimatedSwitcher(
//         duration: const Duration(milliseconds: 500),
//         switchInCurve: AppTheme.animationCurveDefault,
//         switchOutCurve: AppTheme.animationCurveDefault.flipped,
//         transitionBuilder: (child, animation) {
//           return ScaleTransition(
//             scale: animation,
//             child: FadeTransition(
//               opacity: animation,
//               child: child,
//             ),
//           );
//         },
//         child: Text(
//           _currentSubtitle,
//           key: ValueKey('subtitle-text-$_subtitleIndex'),
//           style: TextStyle(fontSize: 24.0),
//         ),
//       ),
//     );
//   }
// }
