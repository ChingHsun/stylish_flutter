import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stylish_flutter/components/banner_card.dart';
import 'package:stylish_flutter/components/product_list.dart';
import 'package:stylish_flutter/constants.dart';
import 'package:stylish_flutter/type.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> _categories = [];

  @override
  void initState() {
    getData();
  }

  Future<void> getData() async {
    try {
      final response = await Dio()
          .get('https://api.appworks-school.tw/api/1.0/products/women');
      if (response.statusCode == 200) {
        List<dynamic> temp = response.data['data']
            .map((json) => ProductModal.fromJson(json))
            .toList();

        setState(() {
          _categories = [
            Category('女裝', temp),
          ];
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
    }

    try {
      final response = await Dio()
          .get('https://api.appworks-school.tw/api/1.0/products/men');
      if (response.statusCode == 200) {
        List<dynamic> temp = response.data['data']
            .map((json) => ProductModal.fromJson(json))
            .toList();

        setState(() {
          _categories = [
            ..._categories,
            Category('男裝', temp),
          ];
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
    }

    try {
      final response = await Dio()
          .get('https://api.appworks-school.tw/api/1.0/products/accessories');
      if (response.statusCode == 200) {
        List<dynamic> temp = response.data['data']
            .map((json) => ProductModal.fromJson(json))
            .toList();

        setState(() {
          _categories = [
            ..._categories,
            Category('配件', temp),
          ];
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
    }
  }

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
                      child: ListView.builder(
                          itemCount:
                              _categories.isEmpty ? 0 : _categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                                height: 300,
                                child: ProductList(_categories[index]));
                          })

                      // child: ListView(
                      //   children: [
                      //     Category('女裝', products),
                      //     Category('男裝', products),
                      //     Category('配件', products)
                      //   ]
                      //       .map((category) => SizedBox(
                      //           height: 300, child: ProductList(category)))
                      //       .toList(),
                      // ),
                      )
                  : Expanded(
                      flex: 1,
                      child: (Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _categories
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
