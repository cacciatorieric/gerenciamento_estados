import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/components/app_drawer.dart';
import 'package:gerenciamento_estados/components/badge.dart';
import 'package:gerenciamento_estados/models/cart.dart';
import 'package:gerenciamento_estados/utils/app_routes.dart';
import 'package:provider/provider.dart';
import '../components/product_grid.dart';
import '../models/product_list.dart';

enum FilterOptions { Favorite, All }

class ProductsOverViewPage extends StatefulWidget {
  ProductsOverViewPage({Key? key}) : super(key: key);

  @override
  State<ProductsOverViewPage> createState() => _ProductsOverViewPageState();
}

class _ProductsOverViewPageState extends State<ProductsOverViewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<ProductList>(context); o provider serve para alterar estados em escopo geral
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.Favorite,
                child: Text('Somente Favoritos <3'),
              ),
              const PopupMenuItem(
                value: FilterOptions.All,
                child: Text('Todos'),
              ),
            ],
            onSelected: (FilterOptions selecionado) {
              setState(
                () {
                  if (selecionado == FilterOptions.Favorite) {
                    _showFavoriteOnly = true;
                  } else {
                    _showFavoriteOnly = false;
                  }
                  //debugPrint(_showFavoriteOnly.toString());
                },
              );

              // if (selecionado == FilterOptions.Favorite) {
              //   provider.showFavoriteOnly();
              // } else {
              //   provider.showAll();
              // }
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            builder: (ctx, cart, child) => Badge(
              value: cart.itemsCount.toString(),
              child: child,
            ),
          )
        ],
        title: const Center(
          child: Text('Minha Tela'),
        ),
      ),
      body: ProductGrid(showFavoriteOnly: _showFavoriteOnly),
      drawer: const AppDrawer(),
    );
  }
}
