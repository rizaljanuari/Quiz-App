import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });

    // print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      //its called Maps
      {
        "questionText": "What's your favorite food?",
        "answer": ["Rendang", "Semur jengkol", "Telur ceplok", "Mie indomie"]
      },
      {
        "questionText": "What's your favorite drink?",
        "answer": ["Sprite", "Teh Kotak", "Amidis", "Aqua"]
      },
      {
        "questionText": "What's your favorite snack?",
        "answer": ["Kentang Goreng", "Chiki Balls", "Taro", "Tahu bulat"]
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[_questionIndex]),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
          ],
        ),
      ),
    );
  }
}
