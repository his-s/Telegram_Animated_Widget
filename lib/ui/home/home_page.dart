import 'package:flutter/material.dart';
import 'package:telegram_widgets/ui/download/download_indicator.dart';
import 'package:telegram_widgets/ui/download/download_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: SizedBox(
          height: 180,
          child: Stack(
            children: [
              DownloadIndicatorBackground(
                backgroundColor: Colors.blue,
              ),
              DownloadIndicatorHand(
                progress: .6,
                indicatorColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
