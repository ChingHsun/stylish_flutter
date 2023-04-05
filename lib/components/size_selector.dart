
import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  final bool isSelected;
  final Function onTap;

  SizeSelector({required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          width: 100,
          height: 100,
          color: Colors.grey[300],
          child: Center(
            child: Text(
              'S',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
