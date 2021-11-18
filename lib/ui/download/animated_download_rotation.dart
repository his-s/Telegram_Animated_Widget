import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'animated_download_indicator.dart';

class AnimatedDownloadWithRotation extends StatefulWidget {
  const AnimatedDownloadWithRotation(
      {Key? key,
      this.rotationSpeed = 1,
      this.isCompleted = false,
      required this.completeDuration,
      required this.indicatorColor,
      this.curve = Curves.ease,
      required this.isStarted})
      : super(key: key);
  final double rotationSpeed;
  final bool isCompleted;
  final Duration completeDuration;
  final Color indicatorColor;
  final Curve curve;
  final bool isStarted;
  @override
  _AnimatedDownloadWithRotationState createState() =>
      _AnimatedDownloadWithRotationState();
}

class _AnimatedDownloadWithRotationState
    extends State<AnimatedDownloadWithRotation>
    with SingleTickerProviderStateMixin {
  late final Timer _timer;
  double rotationSpeed = 0;

  @override
  void initState() {
    super.initState();
    rotationSpeed = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 1), (_) {
      if (mounted) {
        setState(() {
          if (!widget.isCompleted && widget.isStarted) {
            rotationSpeed += widget.rotationSpeed / 1000;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..rotateZ(pi * rotationSpeed),
      alignment: Alignment.center,
      child: AnimatedDownloadIndicator(
        completeDuration: widget.completeDuration,
        indicatorColor: widget.indicatorColor,
        isStarted: widget.isStarted,
        curve: widget.curve,
      ),
    );
  }
}
