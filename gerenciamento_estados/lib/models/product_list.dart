import 'package:flutter/cupertino.dart';
import 'package:gerenciamento_estados/data/dammy_data.dart';
import 'package:gerenciamento_estados/models/product.dart';

//Essa classe é a observavel... os observadores serão notificados

class ProductList with ChangeNotifier {
  List<Product> _items = dummyProducts;

  List<Product> get items =>
      [..._items]; //Esse [...] cria um clone da variavel chamada

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); //Ele vai notificar todas as mudanças para o estado fazer as mudanças
  }
}
