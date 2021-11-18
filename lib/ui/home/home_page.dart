import 'package:flutter/material.dart';
import '../download/download_telegram_render.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: DownloadTelegramRender(
          radius: 250,
          completeDuration: Duration(milliseconds: 500),
          isCompleted: false,
          isStarted: true,
          rotationSpeed: 1,
          indicatorColor: Colors.white,
          backgroundColor: Colors.orange,
          iconColor: Colors.white,
          curve: Curves.ease,
        ),
      ),
    );
  }
}
