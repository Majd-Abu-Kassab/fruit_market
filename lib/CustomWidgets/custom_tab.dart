import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onTap;

  const MyTab({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: isSelected ? Colors.blue : Colors.transparent,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.blue : Colors.grey[700],
          ),
        ),
      ),
    );
  }
}