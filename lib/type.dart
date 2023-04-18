class ProductModal {
  final int id;
  final String category;
  final String title;
  final String description;
  final int price;
  final String texture;
  final String wash;
  final String place;
  final String note;
  final String story;
  final List<ColorClass> colors;
  final List<String> sizes;
  final List<Variant> variants;
  final String mainImage;
  final List<String> images;

  ProductModal({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.texture,
    required this.wash,
    required this.place,
    required this.note,
    required this.story,
    required this.colors,
    required this.sizes,
    required this.variants,
    required this.mainImage,
    required this.images,
  });

  factory ProductModal.fromJson(Map<String, dynamic> json) {
    final List<ColorClass> colors = (json['colors'] as List)
        .map((colorJson) => ColorClass.fromJson(colorJson))
        .toList();

    final List<Variant> variants = (json['variants'] as List)
        .map((variantJson) => Variant.fromJson(variantJson))
        .toList();

    return ProductModal(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      texture: json['texture'],
      wash: json['wash'],
      place: json['place'],
      note: json['note'],
      story: json['story'],
      colors: colors,
      sizes: List<String>.from(json['sizes']),
      variants: variants,
      mainImage: json['main_image'],
      images: List<String>.from(json['images']),
    );
  }
}

class Product {
  late String id;
  late String title;
  late int price;
  late String description;
  late String texture;
  late String wash;
  late String place;
  late String note;
  late String story;
  late List<ColorClass> colors;
  late List<String> sizes;
  late List<Variant> variants;
  late String mainImage;
  late List<String> images;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.texture,
      required this.wash,
      required this.place,
      required this.note,
      required this.story,
      required this.colors,
      required this.sizes,
      required this.variants,
      required this.mainImage,
      required this.images});
}

class ColorClass {
  late String name;
  late String code;

  ColorClass({required this.name, required this.code});

  factory ColorClass.fromJson(Map<String, dynamic> json) {
    return ColorClass(code: json['code'], name: json['name']);
  }
}

class Variant {
  late String size;
  late int stock;
  late String colorCode;

  Variant({required this.size, required this.stock, required this.colorCode});

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      colorCode: json['color_code'],
      size: json['size'],
      stock: json['stock'],
    );
  }
}

class Category {
  String name;
  List<dynamic> products;

  Category(this.name, this.products);
}
