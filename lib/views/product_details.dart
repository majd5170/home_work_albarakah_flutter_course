import 'package:flutter/material.dart';
import 'package:laza_app/model/product_model.dart';

class ProductDetails extends StatelessWidget {
   ProductDetails({super.key, required this.productModel});
  final ProductModel productModel ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: productModel.id,
                child: Image.network(productModel.thumbnail)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(productModel.category ,style: TextStyle(fontSize: 13 , fontWeight: FontWeight.w400 , color: Color(0xff8F959E)),),
                  Text(productModel.brand ,style: TextStyle(fontSize: 13 , fontWeight: FontWeight.w400 , color: Color(0xff8F959E)),),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(productModel.title,style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w600 , color: Color(0xff1D1E20)),),
                  Text(productModel.price.toString(),style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w600 , color: Color(0xff1D1E20)),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 77,
                    height: 77,
                    color: Colors.red,
                  ),
                  Container(
                    width: 77,
                    height: 77,
                    color: Colors.amber,
                  ),
                  Container(
                    width: 77,
                    height: 77,
                    color: Colors.red,
                  ),
                  Container(
                    width: 77,
                    height: 77,
                    color: Colors.amber,
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text('Description' ,style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w600 , color: Color(0xff1D1E20)),),
              Text(productModel.description.toString() ,style: TextStyle(fontSize: 17 , fontWeight: FontWeight.w600 ,color:Colors.grey),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Reviews' ,style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w600 , color: Color(0xff1D1E20))),
                  Text(productModel.rating.toString() ,style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w600 , color: Color(0xff3D93F8)),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}