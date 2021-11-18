import 'package:flutter/material.dart';
import 'package:telegram_widgets/ui/home/home_page.dart';

import 'ui/download/download_telegram_render.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
