import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/models/cart.dart';
import 'package:gerenciamento_estados/models/product_list.dart';
import 'package:gerenciamento_estados/pages/counter_page.dart';
import 'package:gerenciamento_estados/pages/product_detail_page.dart';
import 'package:gerenciamento_estados/pages/products_overview_page.dart';
import 'package:gerenciamento_estados/providers/counter.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gerenciamento de Estados',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: ProductsOverViewPage(),
        routes: {AppRoutes.PRODUCT_DETAIL: (ctx) => const CounterPage()},
      ),
    );
  }
}
