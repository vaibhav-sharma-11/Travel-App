import 'package:flutter/material.dart';
import 'dart:ui';

class anothertext extends StatelessWidget {


  String line;
  double size;
  final Color color;

  anothertext({
    required this.line,
    this.size = 16,
    this.color = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      line,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
