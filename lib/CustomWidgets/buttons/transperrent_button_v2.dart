import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransparentButtonV2 extends StatelessWidget {
  final String hint;
  final VoidCallback onTap;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final double padding;
  final TextStyle textStyle;
  final Color? Tc;
  final Color ? buttonCo;

  const TransparentButtonV2({
    required this.hint,
    required this.onTap,
    this.borderColor = Colors.grey,
    this.borderWidth = 1,
    this.borderRadius = 10,
    this.padding = 12,
    this.textStyle = const TextStyle(color: Colors.white), this.buttonCo, this.Tc,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: buttonCo,
            border: Border.all(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Text(
                hint,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
