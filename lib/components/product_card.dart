import 'package:flutter/material.dart';
import 'package:stylish_flutter/class/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(children: <Widget>[
      Image.asset(
        product.image,
        width: 100,
        height: 150,
        fit: BoxFit.fill,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name),
            SizedBox(height: 8.0),
            Text('NT\$ ${product.price}'),
          ],
        ),
      ),
    ]));
  }
}
