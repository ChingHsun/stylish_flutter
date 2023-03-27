import 'package:flutter/material.dart';
import 'package:stylish_flutter/class/product.dart';

class BannerCard extends StatelessWidget {
  final Product product;

  BannerCard(this.product, {super.key});

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
        product.image,
        fit: BoxFit.fill,
      ),
    );
  }
}
