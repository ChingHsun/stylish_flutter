import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String? productId;

  ProductPage({super.key, this.productId});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProductPage',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          centerTitle: true,
          title: Image.asset(
            'images/logo.png',
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        body: SafeArea(child: Text('test')),
      ),
    );
  }
}
