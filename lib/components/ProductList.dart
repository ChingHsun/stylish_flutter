import 'package:flutter/material.dart';
import 'package:stylish_flutter/components/ProductCard.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Text('女裝'),
      ProductCard(),
      ProductCard(),
      ProductCard(),
      ProductCard(),
      ProductCard(),
      ProductCard(),
    ]);
  }
}
