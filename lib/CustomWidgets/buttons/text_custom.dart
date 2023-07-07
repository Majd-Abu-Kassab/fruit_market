import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String message;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const TextCustom({
    Key? key,
    required this.message,
    this.fontSize = 16.0,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(fontSize: fontSize, color: color,fontWeight: fontWeight,),
    );
  }
}