import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_flutter/class/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () =>
            context.goNamed('product', params: {'productId': product.id}),
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                product.image,
                width: 100,
                height: 150,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Padding(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
