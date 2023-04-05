import 'package:stylish_flutter/type.dart';

final Product product1 = Product(
    id: '201807201824',
    title: "前開衩扭結洋裝",
    description: "厚薄：薄\r\n彈性：無",
    price: 799,
    texture: "棉 100%",
    wash: "手洗，溫水",
    place: "中國",
    note: "實品顏色依單品照為主",
    story:
        "O.N.S is all about options, which is why we took our staple polo shirt and upgraded it with slubby linen jersey, making it even lighter for those who prefer their summer style extra-breezy.",
    mainImage: "https://fakeimg.pl/600x800/",
    images: [
      "https://fakeimg.pl/960x540/",
      "https://fakeimg.pl/960x540/",
      "https://fakeimg.pl/960x540/",
      "https://fakeimg.pl/960x540/",
    ],
    variants: [
      Variant(colorCode: "FFFFFF", size: "S", stock: 2),
      Variant(colorCode: "FFFFFF", size: "M", stock: 1),
      Variant(colorCode: "FFFFFF", size: "L", stock: 2),
    ],
    colors: [
      ColorClass(code: "FFFFFF", name: "白色"),
    ],
    sizes: [
      "S",
      "M",
      "L"
    ]);

final Product product2 = Product(
    id: '201902191210',
    title: "精緻扭結洋裝",
    description: "厚薄：薄\r\n彈性：無",
    price: 999,
    texture: "棉 100%",
    wash: "手洗",
    place: "越南",
    note: "實品顏色依單品照為主",
    story:
        "O.N.S is all about options, which is why we took our staple polo shirt and upgraded it with slubby linen jersey, making it even lighter for those who prefer their summer style extra-breezy.",
    mainImage: "https://fakeimg.pl/600x800/",
    images: [
      "https://fakeimg.pl/960x540/",
      "https://fakeimg.pl/960x540/",
      "https://fakeimg.pl/960x540/",
      "https://fakeimg.pl/960x540/",
    ],
    variants: [
      Variant(colorCode: "FFFFFF", size: "S", stock: 0),
      Variant(colorCode: "FFDDDD", size: "M", stock: 1),
    ],
    colors: [
      ColorClass(code: "FFFFFF", name: "白色"),
      ColorClass(code: "FFDDDD", name: "粉紅"),
    ],
    sizes: [
      "S",
      "M",
    ]);

final List<Product> hotProducts = List<Product>.generate(
    6, (index) => (index % 2 == 0) ? product1 : product2,
    growable: false);

final List<Product> products = List<Product>.generate(
    12, (index) => (index % 2 == 0) ? product1 : product2,
    growable: false);

final List<Category> categories = [
  Category('女裝', products),
  Category('男裝', products),
  Category('配飾', products),
];
