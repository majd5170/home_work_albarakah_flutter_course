
import 'package:flutter/material.dart';
import 'package:laza_app/model/product_model.dart';
import 'package:laza_app/service/product_service.dart';
import 'package:laza_app/views/product_details.dart';
import 'package:laza_app/views/search_Screen.dart';

class HomsPageProduct extends StatelessWidget {
  const HomsPageProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Icon(Icons.menu),
            ),
          ), 
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: (){},
               icon: Icon(Icons.shopping_bag_outlined),
               ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(
              height: 530,
              child:  FutureBuilder(
               future: ProductsServiceImp().getAllProduct(),
               builder:(context, status ) {
            if (status.hasData) {
              dynamic temp = status.data;
              List<ProductModel> search_result = [];
              List<ProductModel> produts = List.generate(temp['products'].length,(index) => ProductModel.fromMap(temp['products'][index]));
              return 
              // Text('data');
              
              searchScaffold(produts: produts, search_result: search_result);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
             ),
            ),
          ]),
        ),
      ),
    );
  }
}
