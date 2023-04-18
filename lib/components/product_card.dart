import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_flutter/type.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductCard extends StatelessWidget {
  final ProductModal product;

  ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.goNamed('product',
            params: {
              'productId': product.id.toString(),
            },
            extra: product),
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: product.mainImage,
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
                      Text(product.title),
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
