import 'package:flutter/material.dart';
import 'package:home_work_lottie/screen/rive/login_rive.dart';
import 'package:lottie/lottie.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.asset('asset/contact.json'),
        
          Container(
                  width: 300,
                  height: 50,
                  child: TextField(
                    // controller: username,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_3_rounded),
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                            ),
                  ),
                ), 
          Container(
                  width: 300,
                  height: 50,
                  child: TextField(
                    
                    // controller: username,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                            ),
                  ),
                ), 

          InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginRive(),
                      ));
                  },
                   child: Center(
                     child: Container(
                      width: 300,
                      height: 40,
                      color: Colors.blue,
                      child: Center(child: Text('Send',  textAlign:TextAlign.center , style: TextStyle(fontSize: 15 , color:Colors.white,  fontWeight: FontWeight.bold),))),
                   ),
                 ),      
        ],
      ),
    );
  }
}