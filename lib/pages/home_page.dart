import 'package:flutter/material.dart';
import 'package:stylish_flutter/components/banner_card.dart';
import 'package:stylish_flutter/components/product_list.dart';
import 'package:stylish_flutter/constants.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  // Get battery level.

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    print('click');

    const platform = MethodChannel('samples.flutter.dev/battery');
    String batteryLevel;
    try {
      final String result = await platform.invokeMethod('getBatteryLevel');
      print(result);
      batteryLevel = result;
    } on PlatformException catch (e) {
      batteryLevel = "Failed: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
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
          title: Image.asset(
            'images/logo.png',
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _getBatteryLevel,
                      child: const Text('Get Battery Level'),
                    ),
                    Text(_batteryLevel),
                  ],
                ),
              ),
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
