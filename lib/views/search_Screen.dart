
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:laza_app/config/di.dart';
import 'package:laza_app/model/categories_model.dart';
import 'package:laza_app/model/product_model.dart';
import 'package:laza_app/service/product_service.dart';
import 'package:laza_app/views/product_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class searchScaffold extends StatefulWidget {
  searchScaffold({
    super.key,
    required this.produts,
    required this.search_result,
  });

  final List<ProductModel> produts;
  final List<ProductModel> search_result;
  final List<String> categories = [
            "smartphones",
            "laptops",
            "fragrances",
            "skincare",
            "groceries",
            "home-decoration",
            "furniture",
            "tops",
            "womens-dresses",
            "womens-shoes",
            "mens-shirts",
            "mens-shoes",
            "mens-watches",
            "womens-watches",
            "womens-bags",
            "womens-jewellery",
            "sunglasses",
            "automotive",
            "motorcycle",
            "lighting"
  ];

  @override
  State<searchScaffold> createState() => _searchScaffoldState();
}

class _searchScaffoldState extends State<searchScaffold> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: 
      Scaffold(
      body:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('Hello', style: TextStyle(fontSize: 28 , fontWeight: FontWeight.w600 ), textAlign: TextAlign.start,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('Welcome to Laza.' , style: TextStyle(color: Color(0xff8F959E) , fontSize: 15 , fontWeight: FontWeight.w400),),
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 275,
              height: 50,
              child: TextField(
                onChanged: (value) {
                  config.get<SharedPreferences>().setString('searched', value);
                  print(value);
                  setState(() {
                    widget.search_result.clear();
                    widget.produts.forEach((element) {
                      if (element.title.contains(value)) {
                        widget.search_result.add(element);
                      }
                    });
                  });
                },
                decoration: InputDecoration(
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                        
                        ),
              ),
            ),
            Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff9775FA),
                      ),
                    child: Icon(Icons.media_bluetooth_off),
                  ),
          ],
        ),
         SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Choose Brand', style: TextStyle(fontSize: 17 , fontWeight: FontWeight.w500 ), textAlign: TextAlign.start,),
                ),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('Welcome to Laza.' , style: TextStyle(color: Color(0xff8F959E) , fontSize: 13 , fontWeight: FontWeight.w400),),
            ),
              ],
            ),
            SizedBox(height: 20,),
              FutureBuilder(
                          future: ProductsServiceImp().getAllProduct(),
                          builder:(context, snapshot ) {
                          if (snapshot.hasData) {dynamic temp = snapshot.data;
                            List<ProductModel> search_result = [];
                          List<ProductModel> produts = List.generate(temp['products'].length,(index) => ProductModel.fromMap(temp['products'][index]));
                return SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: produts.length,
                    itemBuilder: (context, index)=> Container(
                      width: 50,
                      height: 50,
                      color: Colors.white,
                      child: Text(produts[index].category),
                    )
                    ),
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
                        }
                           ),
              SizedBox(height: 20,),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text('New Arraival', style: TextStyle(fontSize: 17 , fontWeight: FontWeight.w500 ), textAlign: TextAlign.start,),
                ),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('Welcome to Laza.' , style: TextStyle(color: Color(0xff8F959E) , fontSize: 13 , fontWeight: FontWeight.w400),),
            ),
              ],
            ),
            FutureBuilder(
                             future: ProductsServiceImp().getAllProduct(),
                             builder:(context, snapshot ) {
                          if (snapshot.hasData) {
                            dynamic temp = snapshot.data;
                            List<ProductModel> search_result = [];
                          List<ProductModel> produts = List.generate(
              temp['products'].length,
              (index) => ProductModel.fromMap(temp['products'][index]));
                return SizedBox(
                  height: 260,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                   gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:  2 ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 150,
          width: 150,
          child: Column(children: [
            Text(produts[index].title),
            InkWell(
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(productModel: produts[index]),));
                },
              child: Hero(
                    
                    tag: produts[index].id,
                    child: Image.network(produts[index].thumbnail)),
            ),
          ]),
        );
      },
  ),
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
                        }
                           ),

  //           SizedBox(height: 300,
            // child: 
  //           ),

        //    SizedBox(
        //   height: 150,
        //   child: ListView.builder(
        //     itemCount: widget.search_result.length,
        //     itemBuilder: (context, index) {
        //       return ListTile(
                
        //         title: Text(widget.search_result[index].title),
        //         leading: 
        //       );
        //     },
        //   ),
        // ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Your Result History'),
      ),
      body: ListTile(
        title: Text(
            config.get<SharedPreferences>().getString('searched') ?? 'Nothing'),
      ),
    );
  }
}