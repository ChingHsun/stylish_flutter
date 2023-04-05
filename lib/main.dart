import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stylish_flutter/constants.dart';
import 'package:stylish_flutter/pages/home_page.dart';
import 'package:stylish_flutter/pages/product_page.dart';
import 'package:stylish_flutter/type.dart';

void main() => runApp(const App());

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: <RouteBase>[
        GoRoute(
          name: 'product',
          path: 'product/:productId',
          builder: (context, state) {
            if (state.extra == null) {
              final productId = state.params['productId']!;
              return ProductPage(
                  productId: productId,
                  product: products.firstWhere((p) => p.id == productId));
              ;
            } else {
              return ProductPage(
                  productId: state.params['productId']!,
                  product: state.extra as Product);
            }
          },
        )
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

class AppState extends ChangeNotifier {}
