import 'package:flutter/material.dart';
import 'package:laza_app/config/di.dart';
import 'package:laza_app/views/home_screen.dart';
import 'package:laza_app/views/login_screen.dart';
import 'package:laza_app/views/navbar.dart';
import 'package:laza_app/views/product_details.dart';
import 'package:laza_app/views/splash_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}
PageController controller = PageController();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen());
  }
}

