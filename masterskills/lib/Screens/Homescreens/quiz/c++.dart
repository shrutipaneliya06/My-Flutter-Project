import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

class cplus extends StatefulWidget {
  const cplus({Key key}) : super(key: key);

  @override
  State<cplus> createState() => _cplusState();
}

class _cplusState extends State<cplus> {
  final _questions = const [
    {
      'questionText': 'Q1. Who invented C++?',
      'answers': [
        {'text': 'Dennis Ritchie', 'score': -2},
        {'text': 'Ken Thompson', 'score': -2},
        {'text': 'Bjarne Stroustrup', 'score': 10},
        {'text': 'Brian Kernighan', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. What is C++?',
      'answers': [
        {'text': 'object oriented programming language', 'score': -2},
        {'text': 'object oriented programming language', 'score': -2},
        {'text': 'a functional programming language', 'score': -2},
        {'text': 'supports both', 'score': 10},
      ],
    },
    {
      'questionText':
          ' Q3. Which of the following is the correct syntax of including a user defined header files in C++?',
      'answers': [
        {'text': '#include [userdefined]', 'score': -2},
        {'text': '#include <userdefined.h>', 'score': -2},
        {'text': '#include “userdefined”', 'score': 10},
        {'text': '#include <userdefined>', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q4. Which of the following is a correct identifier in C++?',
      'answers': [
        {'text': 'VAR_1234', 'score': 10},
        {'text': 'var_name', 'score': -2},
        {'text': '7VARNAME', 'score': -2},
        {'text': '7var_name', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q5. Which of the following user-defined header file extension used in c++?',
      'answers': [
        {'text': 'hg', 'score': -2},
        {'text': 'cpp', 'score': -2},
        {'text': 'hf', 'score': -2},
        {'text': 'h', 'score': 10},
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
          'C++',
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
