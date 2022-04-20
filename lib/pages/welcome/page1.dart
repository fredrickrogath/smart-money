// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:smartmoney/home_page.dart';

// class page1 extends StatelessWidget {
//   final int page;
//   final ValueNotifier<double> notifier;

//   page1(this.page, this.notifier);

//   @override
//   Widget build(BuildContext context) {
//     return SlidingPage(
//       notifier: notifier,
//       page: page,
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Center(
//             child: FractionallySizedBox(
//               widthFactor: 1,
//               heightFactor: 0.4,
//               child: SlidingContainer(
//                   child: Image.asset(
//                     "assets/s_2_3.png",
//                   ),
//                   offset: 300),
//             ),
//           ),
//           Center(
//             child: FractionallySizedBox(
//               widthFactor: 0.55,
//               heightFactor: 0.18,
//               child: SlidingContainer(
//                   child: Image.asset(
//                     "assets/s_2_1.png",
//                   ),
//                   offset: 100),
//             ),
//           ),
//           Opacity(
//             opacity: 0.5,
//             child: Align(
//               alignment: const Alignment(0.3, -0.35),
//               child: FractionallySizedBox(
//                 widthFactor: 0.75,
//                 heightFactor: 0.20,
//                 child: SlidingContainer(
//                     child: Image.asset(
//                       "assets/s_2_2.png",
//                     ),
//                     offset: 170),
//               ),
//             ),
//           ),
//           Align(
//             alignment: const Alignment(-0.2, -0.27),
//             child: FractionallySizedBox(
//               widthFactor: 0.16,
//               heightFactor: 0.07,
//               child: SlidingContainer(
//                   child: Image.asset(
//                     "assets/s_2_4.png",
//                   ),
//                   offset: 50),
//             ),
//           ),
//           Align(
//             alignment: const Alignment(0.3, -0.35),
//             child: FractionallySizedBox(
//               widthFactor: 0.14,
//               heightFactor: 0.07,
//               child: SlidingContainer(
//                   child: Image.asset(
//                     "assets/s_2_6.png",
//                   ),
//                   offset: 150),
//             ),
//           ),
//           Align(
//             alignment: const Alignment(0.8, -0.3),
//             child: FractionallySizedBox(
//               widthFactor: 0.15,
//               heightFactor: 0.10,
//               child: SlidingContainer(
//                   child: Image.asset(
//                     "assets/s_2_5.png",
//                   ),
//                   offset: 50),
//             ),
//           ),
//           Align(
//             alignment: const Alignment(0.7, 0.1),
//             child: FractionallySizedBox(
//               widthFactor: 0.25,
//               heightFactor: 0.15,
//               child: SlidingContainer(
//                   child: Image.asset(
//                     "assets/s_2_7.png",
//                   ),
//                   offset: 200),
//             ),
//           ),
//           Align(
//             alignment: const Alignment(0, 0.78),
//             child: SlidingContainer(
//                 offset: 250,
//                 child: AnimatedContainer(
//                   duration: const Duration(seconds: 3),
//                   curve: Curves.fastOutSlowIn,
//                   child: Container(
//                     margin: const EdgeInsets.only(bottom: 70.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         TypewriterAnimatedTextKit(
//                           speed: const Duration(milliseconds: 100),
//                           pause: const Duration(milliseconds: 7000),
//                           totalRepeatCount: 4,
//                           text: const [
//                             "Tom Rabia Tom Rabia Tom Rabia Tom Rabia Tom Rabia Tom"
//                                 "Tom Rabia Tom Rabia Tom Rabia Tom Rabia Tom Rabia Tom Rabia "
//                           ],
//                           textStyle: const TextStyle(
//                             fontSize: 15,
//                             color: Colors.white70,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(
//                           height: 10.0,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 7.0),
//                           child: SizedBox(
//                             width: 200.0,
//                             child: FloatingActionButton.extended(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   PageTransition(
//                                     duration: const Duration(milliseconds: 500),
//                                     reverseDuration:
//                                         const Duration(milliseconds: 500),
//                                     type:
//                                         PageTransitionType.leftToRightWithFade,
//                                     child: homePage(),
//                                   ),
//                                 );
//                                 // Add your onPressed code here!
//                               },
//                               label: const Text(
//                                 'SKIP',
//                                 style: TextStyle(fontWeight: FontWeight.w700),
//                               ),
//                               icon: const Icon(Icons.skip_next),
//                               backgroundColor: const Color(0xFFAAAAAA),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
