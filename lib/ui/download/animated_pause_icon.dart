import 'package:flutter/material.dart';

class AnimatedIconPausePlay extends StatefulWidget {
  const AnimatedIconPausePlay(
      {Key? key,
      required this.isStarted,
      required this.iconColor,
      required this.radius})
      : super(key: key);
  final bool isStarted;
  final Color iconColor;
  final double radius;
  @override
  _AnimatedIconPausePlayState createState() => _AnimatedIconPausePlayState();
}

class _AnimatedIconPausePlayState extends State<AnimatedIconPausePlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _iconController;

  @override
  void initState() {
    super.initState();
    _iconController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  void animatedIcon() {
    setState(() {
      widget.isStarted ? _iconController.forward() : _iconController.reverse();
    });
  }

  @override
  void dispose() {
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: animatedIcon,
      child: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          size: widget.radius / 2,
          color: widget.iconColor,
          progress: _iconController),
    );
  }
}
