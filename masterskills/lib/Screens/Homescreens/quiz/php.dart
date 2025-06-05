import 'package:flutter/material.dart';
import 'package:masterskills/Screens/Homescreens/quiz/quiz.dart';
import 'package:masterskills/Screens/Homescreens/quiz/result.dart';

class php extends StatefulWidget {
  const php({Key key}) : super(key: key);

  @override
  State<php> createState() => _phpState();
}

class _phpState extends State<php> {
  final _questions = const [
    {
      'questionText': 'Q1. What is PHP?',
      'answers': [
        {'text': 'open-source programming language', 'score': -2},
        {
          'text': 'used to develop dynamic and interactive websites',
          'score': -2
        },
        {'text': 'server-side scripting language', 'score': -2},
        {'text': 'All of the mentioned', 'score': 10},
      ],
    },
    {
      'questionText': 'Q2. Who is the father of PHP?',
      'answers': [
        {'text': 'Drek Kolkevi', 'score': -2},
        {'text': 'Willam Makepiece', 'score': -2},
        {'text': 'List Barely', 'score': -2},
        {'text': 'Rasmus Lerdorf', 'score': 10},
      ],
    },
    {
      'questionText': ' Q3. What does PHP stand for?',
      'answers': [
        {'text': 'Hypertext Preprocessor', 'score': 10},
        {'text': 'Preprocessor Home Page', 'score': -2},
        {'text': 'Pretext Hypertext Processor', 'score': -2},
        {'text': 'Personal Hyper Processor', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q4. Which of the following is the correct syntax to write a PHP code?',
      'answers': [
        {'text': '<? ?>', 'score': 10},
        {'text': '<?php ?>', 'score': -2},
        {'text': '< php >', 'score': -2},
        {'text': '< ? php ?>', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q5. Which of the following is the correct way to add a comment in PHP code?',
      'answers': [
        {'text': 'All of the mentioned', 'score': 10},
        {'text': '#', 'score': -2},
        {'text': '//', 'score': -2},
        {'text': '/* */', 'score': -2},
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
          'Php',
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
