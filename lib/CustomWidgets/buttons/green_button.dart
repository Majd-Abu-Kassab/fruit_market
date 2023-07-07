import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({Key? key, this.text,this.click,this.button_color=Colors.red,this.textStyle,this.borderRadius})
      : super(key: key);
  final String? text;
  final TextStyle? textStyle;
  final double ? borderRadius;
  final Color ? button_color;
  final void Function() ? click;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: click,
          child: Text("$text"),
          style: ElevatedButton.styleFrom(
            backgroundColor: button_color,

          ),
        ),
      ),
// Padding
    ); // SizedBox;
  }
}