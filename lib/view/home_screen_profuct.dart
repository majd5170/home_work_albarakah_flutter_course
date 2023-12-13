import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secode_exam_flutter/model/respon/product_model.dart';
import 'package:secode_exam_flutter/service/base_service.dart';
import 'package:dio/dio.dart';


class HomsPageProduct extends StatelessWidget {
  // const HomsPageProduct({super.key});

  TextEditingController textfild = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: NavigationBar(
          selectedIndex: 1,
          onDestinationSelected: (value) {
            
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.favorite), label: ''),
            NavigationDestination(icon: Icon(Icons.shopping_bag_outlined), label: ''),
            // find name icon
            NavigationDestination(icon: Icon(Icons.report), label: ''),
          ]),
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
                    // onChanged: (value){
                    //   if(enterdkeyword.isEmpy){
                    //   }else{
                    //   }
                    // },
                      controller: textfild,
                     decoration: InputDecoration(
                        // labelText: ,
                        
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          
                        borderRadius: BorderRadius.circular(10)),
                        
                        
                        ),
                        
                    
                  )
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff9775FA),
                      ),
                    child: Icon(Icons.media_bluetooth_off),
                  )
              ],
            ),
            SizedBox(height: 15,),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 115,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffF5F6FA),
                      
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Image.asset('asset/Adidas.png'),
                      Text('data', style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w500),),
                    ],),
                  ),
                  Container(
                    width: 115,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffF5F6FA),
                      
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Image.asset('asset/Vector.png'),
                      Text('data', style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w500),),
                    ],),
                  ),
                  Container(
                    width: 115,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffF5F6FA),
                      
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Image.asset('asset/fila-9 1.png'),
                      Text('data', style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w500),),
                    ],),
                  ),
                ],
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
            SizedBox(
              height: 150,
              child:  FutureBuilder(
               future: getData(),
               builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic temp = snapshot.data;
            List<ProductModel> result = List.generate(temp.data.length,(index) => ProductModel.fromMap(temp.data));
            return  GridView.builder(
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 5,
                                      mainAxisSpacing: 20,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 30
                                      ),
                        itemCount: 2,
                        padding: EdgeInsets.all(10),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {},
                          child: Container(
                                width: 160,
                                height: 203,
                                color: Colors.teal,
                                child: Column(
                                  children: [
                                    Hero(tag: index, child: Image.asset(result[index].images)),
                                    Text(result[index].title),
                
                                  ],
                                ),
                          ),
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
            },
             ),
            ),
          ]),
        ),
      ),
    );
  }
}



