import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_flutter/type.dart';

class BannerCard extends StatelessWidget {
  final Product product;

  BannerCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () =>
            context.goNamed('product', params: {'productId': product.id}),
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          color: Colors.grey,
          margin: EdgeInsets.all(10),
          child: Image.network(
            product.images[0],
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
