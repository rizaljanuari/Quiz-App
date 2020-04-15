import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = const [
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
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
      if (_questionIndex < questions.length) {
        print('we have more questions');
      } else {
        print('we have no more');
      }
    });

    // print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: <Widget>[
                  Question(
                    questions[_questionIndex]["questionText"],
                  ),
                  //the three dots (...) are Dart operator syntax called Spread Operator. Its mean they take a list and pull all the values in the list out of it andd add them to the surrounding list as individual values, mereun.
                  ...(questions[_questionIndex]["answer"] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList(),
                ],
              )
            : Center(
                child: Text("Quiz finished!"),
              ),
      ),
    );
  }
}
