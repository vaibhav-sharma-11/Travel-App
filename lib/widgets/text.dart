import 'package:flutter/material.dart';

class text extends StatelessWidget {


  String line;
  double size;
  final Color color;

  text({
    required this.line,
    this.size = 16,
    this.color = Colors.black,
});

  @override
  Widget build(BuildContext context) {
    return Text(
      line,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: color,
      ),
    );
  }
}
