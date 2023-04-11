import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_flutter/components/color_selector.dart';
import 'package:stylish_flutter/components/count_button.dart';
import 'package:stylish_flutter/components/size_selector.dart';
import 'package:stylish_flutter/components/vertical_line.dart';
import 'package:stylish_flutter/type.dart';

class ProductPage extends StatefulWidget {
  final String? productId;
  final Product product;
  String? selectedCode;
  String? selectedSize;

  ProductPage({super.key, this.productId, required this.product});

  @override
  State<ProductPage> createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;

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
              child: Image.network(
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
                    Image.network(
                      product.mainImage,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      product.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(product.title),
                    SizedBox(
                      height: 10,
                    ),
                    Text('NT\$ $product.price.toString()'),
                    Divider(),
                    Row(
                      children: [
                        Text('顏色'),
                        VerticalLine(),
                        ...product.colors.map(
                          (color) => ColorSelector(
                            color: color,
                            isSelected: widget.selectedCode == color.code,
                            onTap: (colorCode) {
                              setState(() {
                                widget.selectedCode = colorCode;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text('尺寸'),
                        VerticalLine(),
                        ...product.sizes.map(
                          (size) => SizeSelector(
                            size: size,
                            isSelected: widget.selectedSize == size,
                            onTap: (size) {
                              setState(() {
                                widget.selectedSize = size;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text('數量'),
                        VerticalLine(),
                        CountButton(),
                      ],
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text('請選擇尺寸'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '實品顏色依單品照為主',
                        ),
                        Text(product.texture),
                        Text(product.wash),
                        Text('加工產地 $product.place'),
                      ],
                    ),
                    Text('細部說明'),
                    Text(product.story),
                    Wrap(
                      spacing: 8.0, // 每個元素之間的水平間距
                      runSpacing: 4.0, // 每行之間的垂直間距
                      children:
                          product.images.map((i) => Image.network(i)).toList(),
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
