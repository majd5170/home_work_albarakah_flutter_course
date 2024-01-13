import 'package:flutter/material.dart';
import 'package:rive/rive.dart';


class LoginRive extends StatelessWidget {
  const LoginRive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // RiveAnimation.asset('asset/rive/login.riv'),
           RiveAnimation.network(
            
          'https://cdn.rive.app/animations/vehicles.riv',
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
          Container(
                  width: 300,
                  height: 50,
                  child: TextField(
                    
                    // controller: username,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                            ),
                  ),
                ), 

          InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ProductScreen(),
                    //   ));
                  },
                   child: Center(
                     child: Container(
                      width: 300,
                      height: 40,
                      color: Colors.blue,
                      child: Center(child: Text('Login',  textAlign:TextAlign.center , style: TextStyle(fontSize: 15 , color:Colors.white,  fontWeight: FontWeight.bold),))),
                   ),
                 ),      
                 SizedBox(height: 50,)
        ],
      ),
    );
  }
}