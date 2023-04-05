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
}

class Variant {
  late String size;
  late int stock;
  late String colorCode;

  Variant({required this.size, required this.stock, required this.colorCode});
}

class Category {
  String name;
  List<Product> products;

  Category(this.name, this.products);
}
