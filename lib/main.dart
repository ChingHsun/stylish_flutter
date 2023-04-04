import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stylish_flutter/class/category.dart';
import 'package:stylish_flutter/class/product.dart';
import 'package:stylish_flutter/pages/home_page.dart';
import 'package:stylish_flutter/pages/product_page.dart';

void main() => runApp(const App());

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: <RouteBase>[
        GoRoute(
            name: 'product',
            path: 'product/:productId',
            builder: (context, state) =>
                ProductPage(productId: state.params['productId']!)),
      ],
    ),
  ],
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp.router(
        title: 'Stylish',
        routerConfig: _router,
      ),
    );
  }
}

class AppState extends ChangeNotifier {
  final List<Product> hotProducts = List<Product>.generate(
      6,
      (i) => Product(
          'product$i', "UNIQLO 特級極輕羽絨外套", 323, "images/placeholder.png"),
      growable: false);

  final List<Category> categories = [
    Category(
        '女裝',
        List<Product>.generate(
            12,
            (i) => Product(
                'product$i', "UNIQLO 特級極輕羽絨外套", 323, "images/placeholder.png"),
            growable: false)),
    Category(
        '男裝',
        List<Product>.generate(
            12,
            (i) => Product(
                'product$i', "UNIQLO 特級極輕羽絨外套", 323, "images/placeholder.png"),
            growable: false)),
    Category(
        '配飾',
        List<Product>.generate(
            12,
            (i) => Product(
                'product$i', "UNIQLO 特級極輕羽絨外套", 323, "images/placeholder.png"),
            growable: false)),
  ];
}
