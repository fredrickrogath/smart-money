import 'package:flutter/material.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartmoney/common/flutter_sliding_tutorial.dart';

class welcomePage extends StatefulWidget {
  welcomePage({
    Key? key,
  }) : super(key: key);

  @override
  _welcomePageState createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  final ValueNotifier<double> notifier = ValueNotifier(0);
  final _pageCtrl = PageController();
  int pageCount = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: <Widget>[
          /// [StatefulWidget] with [PageView] and [AnimatedBackgroundColor].
          SlidingTutorial(
            controller: _pageCtrl,
            pageCount: pageCount,
            notifier: notifier,
          ),

          /// Separator.
          Align(
            alignment: const Alignment(0, 0.85),
            child: Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                _pageCtrl.previousPage(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.linear,
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
                textDirection: TextDirection.rtl,
              ),
              onPressed: () {
                _pageCtrl.nextPage(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.linear,
                );
              },
            ),
          ),

          /// [SlidingIndicator] for [PageView] in [SlidingTutorial].
          Align(
            alignment: const Alignment(0, 0.94),
            child: SlidingIndicator(
              indicatorCount: 3,
              // indicatorCount: pageCount,
              notifier: notifier,
              activeIndicator: const Icon(
                Icons.check_circle,
                color: Colors.white70,
              ),
              inActiveIndicator: SvgPicture.asset(
                "assets/hollow_circle.svg",
              ),
              margin: 8,
              inactiveIndicatorSize: 14,
              activeIndicatorSize: 24,
            ),
          ),
        ],
      )),
    );
  }
}
