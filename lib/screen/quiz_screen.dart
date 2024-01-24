import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _words = '';
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    _controller.text = result.recognizedWords;
    setState(() {
      _words = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xffFFBB64),
        title: Text('Welcome Boy!!'),
        centerTitle: true,
      ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             Container(
              padding: EdgeInsets.all(20),
              width: 320,
              height: 210,
              decoration: BoxDecoration(
                color: Color(0xffFFEAA7),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('What is the name of this animal??' , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold),),
                    Lottie.network(
                        fit: BoxFit.cover,
                         width: 100,
                      'https://lottie.host/8ca4c3a0-bb14-427e-8574-8b3ca8604b65/NIu4pdQAgr.json',
                    )
                  ],
                ),
              ),
            ),
            Text(_speechToText.isListening
                ? _words
                : _speechEnabled
                    ? 'Press the Microphone to Start Speech to Text'
                    : 'Speech Not Available' ,  style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold),),
              Container(
              color: Colors.white,
              width: 350,
              height: 70,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffix: IconButton(
                      onPressed: _speechToText.isListening
                          ? _stopListening
                          : _startListening,
                      icon: Icon(_speechToText.isListening
                          ? Icons.mic_off
                          : Icons.mic),
                    ),
                    hintText: 'Your Spoken Text'),
              ),
            ),
            
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              width: 350,
              height: 240,
              child: SfSignaturePad(
                onDrawEnd: () {
                  print('object');
                },
                
                maximumStrokeWidth: 7,
                // strokeColor: Colors.red,
                backgroundColor: Color(0xffDCFFB7),
              ),
            ),
            
          ],
        )
        ))
        ;
  }
}
