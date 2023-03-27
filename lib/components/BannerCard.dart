import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      color: Colors.grey,
      margin: EdgeInsets.all(10),
      child: Image.asset(
        'images/placeholder.png',
        fit: BoxFit.fill,
      ),
    );
  }
}
