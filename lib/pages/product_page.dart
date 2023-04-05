import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_flutter/components/color_selector.dart';
import 'package:stylish_flutter/components/count_button.dart';
import 'package:stylish_flutter/components/size_selector.dart';
import 'package:stylish_flutter/components/vertical_line.dart';

class ProductPage extends StatefulWidget {
  final String? productId;

  ProductPage({super.key, this.productId});

  @override
  State<ProductPage> createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProductPage',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          centerTitle: true,
          title: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => context.goNamed('home'),
              child: Image.asset(
                'images/logo.png',
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 800,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(
                      'images/placeholder.png',
                      fit: BoxFit.fill,
                    ),
                    Text(
                      '產品名稱',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('產品 id'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('NT\$ 322'),
                    Divider(),
                    Row(
                      children: [
                        Text('顏色'),
                        VerticalLine(),
                        ColorSelector(
                          isSelected: _isSelected,
                          onTap: () {
                            setState(() {
                              _isSelected = !_isSelected;
                            });
                          },
                        ),
                        ColorSelector(
                          isSelected: _isSelected,
                          onTap: () {
                            setState(() {
                              _isSelected = !_isSelected;
                            });
                          },
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text('尺寸'),
                        VerticalLine(),
                        SizeSelector(
                          isSelected: _isSelected,
                          onTap: () {
                            setState(() {
                              _isSelected = !_isSelected;
                            });
                          },
                        ),
                        SizeSelector(
                          isSelected: _isSelected,
                          onTap: () {
                            setState(() {
                              _isSelected = !_isSelected;
                            });
                          },
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text('數量'),
                        VerticalLine(),
                        CountButton(
                          isSelected: _isSelected,
                          onTap: () {
                            setState(() {
                              _isSelected = !_isSelected;
                            });
                          },
                        ),
                        Text('1'),
                        CountButton(
                          isSelected: _isSelected,
                          onTap: () {
                            setState(() {
                              _isSelected = !_isSelected;
                            });
                          },
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text('請選擇尺寸'),
                    ),
                    Wrap(
                      children: [
                        Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                        Text(
                            'Suspendisse vel placerat lacus, et porttitor urna.'),
                        Text(
                            'Morbi consequat erat quis risus ullamcorper tristique.'),
                        Text(
                            'Nullam tincidunt orci a odio laoreet, in aliquam lorem facilisis.'),
                        Text(
                            'Fusce convallis mi ac ante finibus, eget eleifend risus porttitor.'),
                      ],
                    ),
                    Text('細部說明'),
                    Text(
                        'This text is very very very very very very very very very very very very very very very very very very very very very very very very very long'),
                    Wrap(
                      spacing: 8.0, // 每個元素之間的水平間距
                      runSpacing: 4.0, // 每行之間的垂直間距
                      children: [
                        Image.asset('images/placeholder.png'),
                        Image.asset('images/placeholder.png'),
                        Image.asset('images/placeholder.png'),
                        Image.asset('images/placeholder.png'),
                        Image.asset('images/placeholder.png'),
                        Image.asset('images/placeholder.png'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
