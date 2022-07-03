import 'package:flutter/cupertino.dart';
import 'package:gerenciamento_estados/data/dammy_data.dart';
import 'package:gerenciamento_estados/models/product.dart';

//Essa classe é a observavel... os observadores serão notificados

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;
  bool _showFavoriteOnly = false;

  List<Product> get items {
    if (_showFavoriteOnly) {
      return _items
          .where((prod) => prod.isFavorite!)
          .toList(); //Where funciona como um filter
      //Se a flag _showFavoriteOnly for true, vai retornar os cards que estão com o isFAvorite true tbm
    }
    return [..._items]; //Esse [...] cria um clone da variavel chamada
  }

  void showFavoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); //Ele vai notificar todas as mudanças para o estado fazer as mudanças
  }
}
