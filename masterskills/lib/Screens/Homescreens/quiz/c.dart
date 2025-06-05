import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

class c extends StatefulWidget {
  const c({Key key}) : super(key: key);

  @override
  State<c> createState() => _cState();
}

class _cState extends State<c> {
  final _questions = const [
    {
      'questionText': 'Q1.  Who is the father of C language?',
      'answers': [
        {'text': 'Steve Jobs', 'score': -2},
        {'text': 'James Gosling', 'score': -2},
        {'text': 'Dennis Ritchie', 'score': 10},
        {'text': 'Rasmus Lerdorf', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q2. Which of the following is not a valid C variable name?',
      'answers': [
        {'text': 'int number;', 'score': -2},
        {'text': 'float rate;', 'score': -2},
        {'text': 'int variable_count;', 'score': -2},
        {'text': 'int \$main;', 'score': 10},
      ],
    },
    {
      'questionText': ' Q3.  All keywords in C are in ____________',
      'answers': [
        {'text': 'LowerCase letters', 'score': 10},
        {'text': 'UpperCase letters', 'score': -2},
        {'text': 'CamelCase letters', 'score': -2},
        {'text': 'None of the mentioned', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q4.  Which of the following cannot be a variable name in C?',
      'answers': [
        {'text': 'volatile', 'score': 10},
        {'text': 'true', 'score': -2},
        {'text': 'friend', 'score': -2},
        {'text': 'export', 'score': -2},
      ],
    },
    {
      'questionText': 'Q5. What is #include <stdio.h>?',
      'answers': [
        {
          'text': 'Preprocessor directive',
          'score': 10,
        },
        {'text': 'Inclusion directive', 'score': -2},
        {'text': 'File inclusion directive', 'score': -2},
        {'text': 'None of the mentioned', 'score': -2},
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
          'C',
          style: TextStyle(fontSize: 40),
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
