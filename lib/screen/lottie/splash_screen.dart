import 'package:flutter/material.dart';
import 'package:home_work_lottie/screen/lottie/contact_screen.dart';
import 'package:home_work_lottie/screen/lottie/login_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  
}
  

class _SplashScreenState extends State<SplashScreen> {
  @override
    void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 8)).then((value) => setState(() {
       Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
    }));
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body:Lottie.network(
        
        
        'https://lottie.host/1a021360-ba97-4b59-8dfb-cf546d1bf238/iWA8x5ta50.json'
      ) ,
    );
  }
}