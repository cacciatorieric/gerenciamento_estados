import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/models/product.dart';
import 'package:gerenciamento_estados/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed: () {
              product.toggleFavorite();
            },
            icon: Icon(
                product.isFavorite! ? Icons.favorite : Icons.favorite_border),
          ),
          title: Text(product.title!),
          trailing: const Icon(Icons.shopping_cart),
        ),
        child: GestureDetector(
          child: Image.network(
            product.imageUrl!,
            fit: BoxFit.cover,
          ),
          onTap: () => Navigator.of(context).pushNamed(
            AppRoutes.PRODUCT_DETAIL,
            arguments: product,
          ),
        ),
      ),
    );
  }
}
