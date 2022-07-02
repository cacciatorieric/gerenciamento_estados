import 'package:flutter/material.dart';
import 'package:gerenciamento_estados/providers/counter.dart';
import '../models/product.dart';

class CounterPage extends StatefulWidget {
  //final Product product;
  const CounterPage({
    Key? key,
    //required this.product,
  }) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
      ),
      body: Column(
        children: [
          Text(CounterProvider.of(context)?.state.value.toString() ?? '0'),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                CounterProvider.of(context)?.state.inc();
              });
              debugPrint(CounterProvider.of(context)?.state.value.toString());
            },
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              setState(() {
                CounterProvider.of(context)?.state.dec();
              });

              debugPrint(CounterProvider.of(context)?.state.value.toString());
            },
          ),
        ],
      ),
    );
  }
}
