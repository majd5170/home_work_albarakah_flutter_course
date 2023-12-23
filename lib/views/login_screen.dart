import 'package:flutter/material.dart';
import 'package:laza_app/config/di.dart';
import 'package:laza_app/views/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
        ),
        body:Center(
          child: Container(
              width: double.infinity,
              height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Container(
                  width: 300,
                  height: 50,
                  child: TextField(
                    controller: username,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                            ),
                  ),
                ), 
                 Container(
                  width: 300,
                  height: 50,
                  child: TextField(
                    obscureText: true,
                    controller: password,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                           ),
                  ),
                ), 
                 InkWell(
                  onTap: () {
                    
                  print('${username.text} + ${password.text}');
                  if (username.text.contains('majd') && password.text.contains('123456')) {
                    // whatever = username.text;
                    // config.get<SharedPreferences>().setString('title', username.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBar(),
                      ),
                    );
                  }
        
                    
                  },
                   child: Center(
                     child: Container(
                      width: 300,
                      height: 40,
                      color: Colors.blue,
                      child: Center(child: Text('Login', textAlign:TextAlign.center , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),))),
                   ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}