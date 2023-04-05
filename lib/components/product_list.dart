import 'package:flutter/material.dart';
import 'package:stylish_flutter/components/product_card.dart';
import 'package:stylish_flutter/type.dart';

class ProductList extends StatelessWidget {
  final Category category;

  ProductList(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Text(category.name),
        Expanded(
          child: ListView(
              children: category.products
                  .map((product) => ProductCard(product))
                  .toList()),
        ),
      ],
    );
  }
}
