import 'package:flutter/material.dart';
import 'package:laza_app/model/product_model.dart';
import 'package:laza_app/service/product_service.dart';

class AddNewProduct extends StatelessWidget {
  // const AddNewProduct({super.key});

  TextEditingController id = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController rating = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController category = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Row(
                
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                    child: Text('id' ,style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold), ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
            Container(
              width: 170,
              height: 50,
              child: TextField(
                controller: id,
                onChanged: (value) {},
                decoration: InputDecoration(
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                        
                        ),
              ),
            ),     
            Container(
                    child: Text(' title' ,style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold), ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
            Container(
              width: 180,
              height: 50,
              child: TextField(
                controller: title,
                onChanged: (value) {},
                decoration: InputDecoration(
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                        
                        ),
              ),
            ),         
          ],
        ),
                          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                    child: Text('description' ,style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold), ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
            Container(
              width: 250,
              height: 50,
              child: TextField(
                controller: description,
                onChanged: (value) {},
                decoration: InputDecoration(
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                        
                        ),
              ),
            ),         
          ],
        ),
                          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                    child: Text('price' ,style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold), ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
            Container(
              width: 100,
              height: 50,
              child: TextField(
                controller: price,
                onChanged: (value) {},
                decoration: InputDecoration(
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                        
                        ),
              ),
            ),         
          ],
        ),
                          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                    child: Text('rating' ,style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold), ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
            Container(
              width: 100,
              height: 50,
              child: TextField(
                controller: rating,
                onChanged: (value) {},
                decoration: InputDecoration(
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                        
                        ),
              ),
            ),         
          ],
        ),
                          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                    child: Text('brand' ,style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold), ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
            Container(
              width: 180,
              height: 50,
              child: TextField(
                controller: brand,
                onChanged: (value) {},
                decoration: InputDecoration(
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                        
                        ),
              ),
            ),         
          ],
        ),
                          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                    child: Text('image' ,style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold), ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
            Container(
              width: 180,
              height: 70,
              child: TextField(
                  controller: image,
                onChanged: (value) {},
                decoration: InputDecoration(
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                        
                        ),
                ),
               ),         
              ],
             ),
                         Row(
                           children: [
                             Container(
                                                 child: Text('category' ,style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold), ),
                                               ),
                  SizedBox(
                    width: 10,
                  ),
                         Container(
              width: 180,
              height: 70,
              child: TextField(
                  controller: image,
                onChanged: (value) {},
                decoration: InputDecoration(
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                        
                        ),
                ),
               ),    
                  ],
                         ),  
             InkWell(
              onTap: () async{
                
                
                ProductModel createNewProduct = ProductModel(
                  title: title.text,
                  description: description.text,
                  brand: brand.text,
                  price: int.parse(price.text),
                  rating: int.parse(rating.text),
                  category: category.text,
                  thumbnail: image.text,
                   id: int.parse(id.text),
                );
                  // await ProductsService.createNewProduct(createNewProduct);
              },
               child: Center(
                 child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text('Add' , textAlign: TextAlign.center,)),
                 ),
               ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}

