import 'package:flutter/material.dart';
import '../components/product_grid.dart';

class ProductsOverViewPage extends StatelessWidget {
  ProductsOverViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Minha Tela'),
        ),
      ),
      body: ProductGrid(),
    );
  }
}
