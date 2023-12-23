import 'package:flutter/material.dart';
import 'package:laza_app/views/add_new_product_Scree.dart';
import 'package:laza_app/views/home_screen.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<NavBar> {
  // const NavBar({super.key});
  int selectindex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:  pages[selectindex],
      bottomNavigationBar: NavigationBar(
          selectedIndex: selectindex,
          onDestinationSelected: (value) {
            setState(() {
              selectindex = value;
            });
          },
          destinations: [
             NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.add), label: 'Add'),
            NavigationDestination(icon: Icon(Icons.home), label: ''),
            NavigationDestination(icon: Icon(Icons.home), label: ''),
          ]),
        
      ),
    );
  }
}

List<Widget> pages = [
  HomsPageProduct(),
  AddNewProduct(),
  Scaffold(
    backgroundColor: Colors.white,
  ),
  Scaffold(
    backgroundColor: Colors.red,
  )
];


 
      