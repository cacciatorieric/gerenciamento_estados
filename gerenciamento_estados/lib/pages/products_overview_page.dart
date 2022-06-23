import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/components/product_item.dart';
import 'package:gerenciamento_estados/data/dammy_data.dart';
import 'package:gerenciamento_estados/models/product.dart';

class ProductsOverViewPage extends StatelessWidget {
  final List<Product> loadedProducts = dummyProducts;
  ProductsOverViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Minha Tela'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: loadedProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (ctx, i) => ProductItem(product: loadedProducts[i]),
        ),
      ),
    );
  }
}
