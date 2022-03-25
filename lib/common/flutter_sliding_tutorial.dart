import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';
import 'package:smartmoney/pages/welcome/page1.dart';
import 'package:smartmoney/pages/welcome/page2.dart';
import 'package:smartmoney/pages/welcome/page3.dart';

class SlidingTutorial extends StatefulWidget {
  const SlidingTutorial({
    required this.controller,
    required this.notifier,
    required this.pageCount,
    Key? key,
  }) : super(key: key);

  final ValueNotifier<double> notifier;
  final int pageCount;
  final PageController controller;

  @override
  State<StatefulWidget> createState() => _SlidingTutorial();
}

class _SlidingTutorial extends State<SlidingTutorial> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = widget.controller;

    /// Listen to [PageView] position updates.
    _pageController..addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBackgroundColor(
      colors: const [
        Color(0xFFAAAAAA),
        Color(0xFF669900),
        Color(0xFF0099CC),
        Color(0xFFAA66CC),
        Color(0xFFFF8800)
      ],
      pageController: _pageController,
      pageCount: widget.pageCount,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: List<Widget>.generate(
              3,
              (index) => _getPageByIndex(index),
            ),
          ),
        ],
      ),
    );
  }

  /// Create different [SlidingPage] for indexes.
  Widget _getPageByIndex(int index) {
    switch (index % 3) {
      case 0:
        return page1(index, widget.notifier);
      case 1:
        return page2(index, widget.notifier);
      case 2:
        return page3(index, widget.notifier);
      default:
        throw ArgumentError("Unknown position: $index");
    }
  }

  /// Notify [SlidingPage] about current page changes.
  _onScroll() {
    widget.notifier.value = _pageController.page ?? 0;
  }
}
