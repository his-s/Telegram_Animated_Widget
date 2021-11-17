import 'package:flutter/material.dart';

class DownloadStartCloseButton extends StatelessWidget {
  const DownloadStartCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: CustomPaint(
        painter: BackgroundPainter(),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  BackgroundPainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final backgroundPainter = Paint()
      ..isAntiAlias = true
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, backgroundPainter);
  }

  @override
  bool shouldRepaint(covariant BackgroundPainter oldDelegate) =>
      oldDelegate.color != color;
}
