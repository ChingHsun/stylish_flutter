import 'package:flutter/material.dart';

class VerticalLine extends StatelessWidget {
  VerticalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: Center(
        child: SizedBox(
          width: 1,
          height: 30,
          child: Container(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
