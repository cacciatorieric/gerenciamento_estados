import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/models/cart.dart';
import 'package:gerenciamento_estados/models/order_list.dart';
import 'package:gerenciamento_estados/models/product_list.dart';
import 'package:gerenciamento_estados/pages/cart_page.dart';
import 'package:gerenciamento_estados/pages/product_detail_page.dart';
import 'package:gerenciamento_estados/pages/products_overview_page.dart';
import 'package:gerenciamento_estados/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gerenciamento de Estados',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
              primary: Colors.deepOrange,
              secondary: Colors.white,
              background: Color.fromARGB(255, 238, 238, 238)),
        ),
        home: ProductsOverViewPage(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailPage(),
          AppRoutes.CART: (ctx) => const CartPage(),
        },
      ),
    );
  }
}
