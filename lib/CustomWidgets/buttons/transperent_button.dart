import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final String hint;
  final VoidCallback onTap;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final double padding;
  final TextStyle textStyle;
  final Icon ? iconB;
  final Color bColor;
  final String ?iconIm;
  final double? fontSize;

  const TransparentButton({super.key,
    required this.hint,
    required this.onTap,
    this.borderColor = Colors.grey,
    this.borderWidth = 1,
    this.borderRadius = 10,
    this.padding = 12,
    this.iconB,
    this.iconIm,
    this.textStyle = const TextStyle(color: Colors.black), this.fontSize, this.bColor=Colors.black,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (iconB != null) Icon(
              iconB?.icon,
              color: iconB?.color ?? Colors.grey[400]!,
            ),
            if( iconIm != null) SizedBox(width: 30,child: Image.asset(iconIm!),),
            Align(
              alignment: Alignment.center,
              child: Text(
                hint,
                style: TextStyle(color: Colors.black!, fontSize:textStyle.fontSize),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
