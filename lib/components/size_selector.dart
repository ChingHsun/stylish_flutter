import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  final String size;
  final Function onTap;
  final bool isSelected;

  SizeSelector(
      {required this.isSelected, required this.onTap, required this.size});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          onTap(size);
        },
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            border: isSelected
                ? Border.all(color: Colors.red, width: 2)
                : Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              size,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
