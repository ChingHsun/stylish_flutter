import 'package:flutter/material.dart';
import 'package:stylish_flutter/type.dart';

class ColorSelector extends StatelessWidget {
  final bool isSelected;
  final ColorClass color;
  final Function onTap;

  ColorSelector(
      {required this.isSelected, required this.onTap, required this.color});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          onTap(color.code);
        },
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Color(int.parse('0xFF${color.code}')),
            border: isSelected
                ? Border.all(color: Colors.red, width: 2)
                : Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
