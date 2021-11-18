import 'package:flutter/material.dart';
import 'download_indicator.dart';

class AnimatedDownloadIndicator extends StatefulWidget {
  const AnimatedDownloadIndicator({
    Key? key,
    required this.completeDuration,
    required this.indicatorColor,
    required this.curve,
    required this.isStarted,
  }) : super(key: key);
  final Duration completeDuration;
  final Color indicatorColor;
  final Curve curve;
  final bool isStarted;

  @override
  _AnimatedDownloadIndicatorState createState() =>
      _AnimatedDownloadIndicatorState();
}

class _AnimatedDownloadIndicatorState extends State<AnimatedDownloadIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animationCurve;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.completeDuration,
    );
    _animationCurve = _animationController.drive(CurveTween(
      curve: widget.curve,
    ));
    _animationStarted();
  }

  void _animationStarted() {
    if (mounted) {
      if (widget.isStarted) {
        _animationController.forward();
      }
    }
  }

  @override
  void dispose() {
    _animationController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationCurve,
      builder: (BuildContext context, Widget? child) {
        return DownloadIndicatorHand(
            indicatorColor: widget.indicatorColor,
            progress: _animationCurve.value);
      },
    );
  }
}
