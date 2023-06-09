import 'package:flutter/material.dart';
import 'package:stylish_flutter/components/banner_card.dart';
import 'package:stylish_flutter/components/product_list.dart';
import 'package:stylish_flutter/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 766;

    return MaterialApp(
      title: 'HomePage',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          centerTitle: true,
          title: Image.network(
            'images/logo.png',
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 200.0,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: hotProducts
                      .map((product) => BannerCard(product))
                      .toList(),
                ),
              ),
              isSmallScreen
                  ? Expanded(
                      child: ListView(
                        children: categories
                            .map((category) => SizedBox(
                                height: 300, child: ProductList(category)))
                            .toList(),
                      ),
                    )
                  : Expanded(
                      flex: 1,
                      child: (Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: categories
                            .map((category) =>
                                Expanded(child: ProductList(category)))
                            .toList(),
                      )),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
