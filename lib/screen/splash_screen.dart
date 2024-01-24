import 'package:flutter/material.dart';
import 'package:kids_app/screen/home_screen.dart';
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
                        builder: (context) => home_screen(),
                      ));
    }));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Lottie.network(
        fit: BoxFit.cover,'https://lottie.host/1a021360-ba97-4b59-8dfb-cf546d1bf238/iWA8x5ta50.json'
      ) ,
    );
  }
}
