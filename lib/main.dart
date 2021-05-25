import 'package:flutter/material.dart';
import 'package:flutter_complete_guidelines/answer.dart';
import 'question.dart';
import './answer.dart';
import 'quiz.dart';

import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'question': 'What\'s your favorite color?',
      'answers': [
        {'text': 'red', 'score': 5},
        {'text': 'green', 'score': 3},
        {'text': 'blue', 'score': 2},
        {'text': 'black', 'score': 10},
      ],
    },
    {
      'question': 'What\'s your favorite animal',
      'answers': [
        {'text': 'Rabbit', 'score': 15},
        {'text': 'Snake', 'score': 30},
        {'text': 'Elephant', 'score': 2},
        {'text': 'Lion', 'score': 10},
      ],
    },
    {
      'question': 'Who\'s your favorite instructor',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex += 1;
      print(_questionIndex);
      if (_questionIndex < _questions.length) {
        print("We have more question");
      } else {
        print("No more question");
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}














