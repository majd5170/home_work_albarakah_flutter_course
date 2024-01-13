import 'package:flutter/material.dart';
import 'package:home_work_lottie/screen/lottie/contact_screen.dart';
import 'package:lottie/lottie.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Lottie.asset('asset/contact.json'),
      
         SizedBox(
          height: 695, 
          child: 
         GridView.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 30 
                      ),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactScreen(),
                      ));
                      },
                      child: Container(
                        child: Column(children: [
                          Lottie.asset('asset/cola.json'),
                        ],)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }