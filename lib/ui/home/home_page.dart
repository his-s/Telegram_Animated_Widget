import 'package:flutter/material.dart';
import 'package:telegram_widgets/ui/download/download_indicator.dart';
import 'package:telegram_widgets/ui/download/download_start_close.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 180,
          child: Stack(
            children: [
              DownloadStartCloseButton(),
              DownloadIndicatorHand(),
            ],
          ),
        ),
      ),
    );
  }
}
