import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'animated_download_rotation.dart';

import 'download_background.dart';

class DownloadTelegramRender extends StatelessWidget {
  const DownloadTelegramRender(
      {Key? key,
      required this.isStarted,
      this.backgroundColor = Colors.blue,
      this.radius = 50,
      required this.completeDuration,
      required this.isCompleted,
      this.rotationSpeed = 1,
      this.indicatorColor = Colors.white,
      this.curve = Curves.ease})
      : super(key: key);
  final bool isStarted;
  final Color backgroundColor;

  final double radius;
  final Duration completeDuration;
  final bool isCompleted;
  final double rotationSpeed;
  final Color indicatorColor;
  final Curve curve;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: radius,
      child: Stack(
        alignment: Alignment.center,
        children: [
          DownloadIndicatorBackground(
            backgroundColor: backgroundColor,
          ),
          isStarted
              ? AnimatedDownloadWithRotation(
                  completeDuration: completeDuration,
                  isStarted: isStarted,
                  isCompleted: isCompleted,
                  rotationSpeed: rotationSpeed,
                  indicatorColor: indicatorColor,
                  curve: curve,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
