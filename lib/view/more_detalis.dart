import 'package:flutter/material.dart';
import 'package:secode_exam_flutter/config/di.dart';
import 'package:secode_exam_flutter/model/respon/product_model.dart';
import 'package:secode_exam_flutter/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllDetalis extends StatelessWidget {
  AllDetalis({super.key, required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(config.get<SharedPreferences>().getString('title') ?? "Hello"),
      ),
      body: FutureBuilder(
        future: getData(),
         builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic temp = snapshot.data;
            List<ProductModel> result = List.generate(temp.data.length,(index) => ProductModel.fromMap(temp.data));
            return  ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: Text(result[index].title),
                      leading: Text(result[index].images.toString()),
                      subtitle: Text(result[index].price.toString()),
                    ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: result.length
                );
                     } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                  child: Text('Error'),
                );
              }
            },
         ),
    );
  }
}


