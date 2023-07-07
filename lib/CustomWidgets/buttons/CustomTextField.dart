import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final double borderRadius;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextInputType ?keyboardType;
  final int? minLines;
  final int? maxLines;
  final double? height;
  final bool ? expands;


  const CustomTextField({
    Key? key,
    this.hintText = '',
    this.borderRadius = 0.0,
    this.fontSize = 16.0,
    this.fontFamily = 'Roboto',
    this.fontWeight = FontWeight.normal,  this.keyboardType=TextInputType.text, this.minLines, this.maxLines, this.height, this.expands=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        keyboardType: keyboardType,
        minLines: minLines,
        maxLines: maxLines,
        expands: expands!,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          hintStyle: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}