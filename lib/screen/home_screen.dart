import 'package:flutter/material.dart';
import 'package:kids_app/screen/quiz_screen.dart';
import 'package:lottie/lottie.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFBB64),
        title: Text('Welcome Boy!!'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: GridView.builder(
               padding: EdgeInsets.all(5),
               shrinkWrap: true,
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 crossAxisSpacing: 5,
                 mainAxisSpacing: 5,
               ),
               itemCount: 4,
               itemBuilder: (context, index) {
                 return InkWell(
                  onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(),
                      ));
                  },
                   child: Container(
                    color: Color(0xffFF6868),
                    child: Center(child:
                      Lottie.network(
                        fit: BoxFit.cover,
                        width: 150,
                      'https://lottie.host/8ca4c3a0-bb14-427e-8574-8b3ca8604b65/NIu4pdQAgr.json',
                    )
                      ),
                   ),
                 );
               },
             ),
          ),
        ],
      ),
    );
  }
}