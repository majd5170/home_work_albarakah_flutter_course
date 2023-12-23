
import 'package:flutter/material.dart';
import 'package:laza_app/model/product_model.dart';

class ProductDetails extends StatelessWidget {
   ProductDetails({super.key, required this.productModel});
  final ProductModel productModel ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(
            tag: productModel.id,
            child: Image.network(productModel.thumbnail)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(title: Text(productModel.title),
            subtitle: Text(productModel.price.toString()),
            ),
          )
        ],
      ),
    );
  }
}