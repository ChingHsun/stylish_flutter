import 'package:flutter/material.dart';

class ColorSelector extends StatelessWidget {
  final bool isSelected;
  final Function onTap;

  ColorSelector({required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.yellow,
            border: isSelected ? Border.all(color: Colors.red, width: 2) : null,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
