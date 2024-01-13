import 'package:flutter/material.dart';
import 'package:home_work_lottie/screen/lottie/product_screen.dart';
import 'package:home_work_lottie/screen/lottie/splash_screen.dart';
import 'package:home_work_lottie/screen/rive/login_rive.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginRive();
  }
}