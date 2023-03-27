import 'package:flutter/material.dart';
import 'package:stylish_flutter/components/BannerCard.dart';
import 'package:stylish_flutter/components/ProductList.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Horizontal List';

    return MaterialApp(
      title: title,
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
                children: [
                  Expanded(child: ProductList()),
                  Expanded(child: ProductList()),
                  Expanded(child: ProductList()),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
