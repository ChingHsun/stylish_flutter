import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(children: <Widget>[
      Image.asset(
        'images/placeholder.png',
        width: 100,
        height: 150,
        fit: BoxFit.fill,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('UNIQLO 特級極輕羽絨外套'),
            SizedBox(height: 8.0),
            Text('NT\$ 323'),
          ],
        ),
      ),
    ]));
  }
}
