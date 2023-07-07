import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Colors.green.shade500,
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
