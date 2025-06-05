import 'package:flutter/material.dart';
import 'package:masterskills/Screens/Homescreens/quiz/quiz.dart';
import 'package:masterskills/Screens/Homescreens/quiz/result.dart';

class js extends StatefulWidget {
  const js({Key key}) : super(key: key);

  @override
  State<js> createState() => _jsState();
}

class _jsState extends State<js> {
  final _questions = const [
    {
      'questionText':
          'Q1. Which of the following scoping type does JavaScript use?',
      'answers': [
        {'text': 'Sequential', 'score': -2},
        {'text': 'Segmental', 'score': -2},
        {'text': 'Lexical', 'score': 10},
        {'text': 'Literal ', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. Which of the following is not a framework?',
      'answers': [
        {'text': 'JavaScript .NET', 'score': -2},
        {'text': 'Cocoa JS', 'score': -2},
        {'text': 'jQuery', 'score': -2},
        {'text': 'JavaScript', 'score': 10},
      ],
    },
    {
      'questionText':
          ' Q3. Which of the following is not javascript data types?',
      'answers': [
        {'text': 'All of the mentioned', 'score': 10},
        {'text': 'Null type', 'score': -2},
        {'text': 'Undefined type', 'score': -2},
        {'text': 'Number type', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q4. Which of the following is not an error in JavaScript?',
      'answers': [
        {'text': 'Division by zero', 'score': 10},
        {'text': 'Missing of Bracket', 'score': -2},
        {'text': 'Syntax error', 'score': -2},
        {'text': 'Missing of semicolons', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q5. Which of the following is not javascript data types?',
      'answers': [
        {'text': 'All of the mentioned', 'score': 10},
        {'text': 'Null type', 'score': -2},
        {'text': 'Undefined type', 'score': -2},
        {'text': 'Number type', 'score': -2},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    // ignore: avoid_print
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      // ignore: avoid_print
      print('We have more questions!');
    } else {
      // ignore: avoid_print
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JavaScript',
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              ) //Quiz
            : Result(_totalScore, _resetQuiz),
      ), //Padding
    );
  }
}
