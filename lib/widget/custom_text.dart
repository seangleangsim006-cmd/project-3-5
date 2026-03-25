import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;

  const CustomText({
    super.key,
    required this.text,
    this.size = 18,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color
      ),
    );
  }
}