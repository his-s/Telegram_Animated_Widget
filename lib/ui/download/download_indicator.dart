import 'dart:math';

import 'package:flutter/material.dart';

class DownloadIndicatorHand extends StatelessWidget {
  const DownloadIndicatorHand(
      {Key? key, required this.indicatorColor, required this.progress})
      : super(key: key);
  final Color indicatorColor;
  final double progress;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: CustomPaint(
        painter: IndicatorPainter(
          progress: progress,
          color: indicatorColor,
        ),
      ),
    );
  }
}

class IndicatorPainter extends CustomPainter {
  final Color color;

  final double progress;

  IndicatorPainter({required this.color, required this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final strokeWidth = size.width / 11;
    final radius = (size.width - strokeWidth - 15) / 2;
    final handPainter = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 1.5 * pi,
        2 * pi * progress, false, handPainter);
  }

  @override
  bool shouldRepaint(covariant IndicatorPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
