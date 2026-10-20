import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key, required this.col});

  // List<Product> products;
  final int col;

  @override
  Widget build(BuildContext context) {

    return GridView.count(
        crossAxisCount: col,
        children:
          List.generate(20, (index) {
            final productId = index + 1;
            return ProductItem(id: productId);
          })
        ,
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text('Product #$id'),
    );
  }
}

