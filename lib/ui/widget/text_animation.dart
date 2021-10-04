import 'package:flutter/material.dart';

class TextAnimationWidget extends StatefulWidget {
  final String text;
  final double moveValue;
  final Color color;

  TextAnimationWidget(
      {required this.text, required this.moveValue, required this.color});
  @override
  _TextAnimationWidgetState createState() =>
      _TextAnimationWidgetState(text, moveValue, color);
}

class _TextAnimationWidgetState extends State<TextAnimationWidget>
    with TickerProviderStateMixin {
  String text;
  double moveValue;
  final Color color;

  _TextAnimationWidgetState(this.text, this.moveValue, this.color);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(moveValue, 0.0),
        end: Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: AnimationController(
            duration: const Duration(milliseconds: 500),
            vsync: this,
          )..forward(),
          curve: Curves.linear,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }
}
