import 'package:flutter/material.dart';
import 'package:laza_app/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

PageController controller =PageController();


class _SplashScreenState extends State<SplashScreen> {
@override
  Color color = Colors.lightBlue;
  
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3)).then((value) => setState(() {
      color =Colors.lightBlue;
       Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: color,
        body: Center(
          child: Text('laza', style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500),),
        )
      ),
    );
  }
}

