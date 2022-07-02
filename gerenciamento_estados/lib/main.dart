import 'package:flutter/material.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //O aplicativo está envolvido com o changenotifierprovider 
      create: (_) => ProductList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: ProductsOverViewPage(),
        routes: {AppRoutes.PRODUCT_DETAIL: (ctx) => const CounterPage()},
      ),
    );
  }
}
