import 'package:cosmetic_ui_app/ui/sceeen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cosmetics app',
      home: SplashScreen(),
    );
  }
}

