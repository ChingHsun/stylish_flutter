import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish_flutter/components/banner_card.dart';
import 'package:stylish_flutter/components/product_list.dart';
import 'package:stylish_flutter/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var categories = appState.categories;

    return MaterialApp(
      title: 'HomePage',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Image.asset(
            'images/logo.png',
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 200.0,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  BannerCard(),
                  BannerCard(),
                  BannerCard(),
                  BannerCard(),
                  BannerCard(),
                  BannerCard(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: (Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: categories
                    .map((category) => Expanded(child: ProductList(category)))
                    .toList(),
              )),
            )
          ],
        ),
      ),
    );
  }
}
