import 'package:flutter/material.dart';
import 'package:masterskills/Screens/Homescreens/quiz/quiz.dart';
import 'package:masterskills/Screens/Homescreens/quiz/result.dart';

class sql extends StatefulWidget {
  const sql({Key key}) : super(key: key);

  @override
  State<sql> createState() => _sqlState();
}

class _sqlState extends State<sql> {
  final _questions = const [
    {
      'questionText':
          'Q1. Which SQL function is used to count the number of rows in a SQL query?',
      'answers': [
        {'text': 'COUNT()', 'score': -2},
        {'text': 'NUMBER()', 'score': -2},
        {'text': 'COUNT(*)', 'score': 10},
        {'text': 'SUM()', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q2. Which SQL keyword is used to retrieve a maximum value?',
      'answers': [
        {'text': 'MOST', 'score': -2},
        {'text': 'TOP', 'score': -2},
        {'text': 'UPPER', 'score': -2},
        {'text': 'MAX', 'score': 10},
      ],
    },
    {
      'questionText':
          ' Q3. Which of the following SQL clauses is used to DELETE tuples from a database table?',
      'answers': [
        {'text': 'DELETE', 'score': 10},
        {'text': 'REMOVE', 'score': -2},
        {'text': 'DROP', 'score': -2},
        {'text': 'CLEAR', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. Which of the following is not a DDL command?',
      'answers': [
        {'text': 'UPDATE', 'score': 10},
        {'text': 'ALTER', 'score': -2},
        {'text': 'TRUNCATE', 'score': -2},
        {'text': 'None of the Mentioned', 'score': -2},
      ],
    },
    {
      'questionText': 'Q5. ________________ is not a category of SQL command.',
      'answers': [
        {'text': 'SCL', 'score': 10},
        {'text': 'TCL', 'score': -2},
        {'text': 'DCL', 'score': -2},
        {'text': 'DDL', 'score': -2},
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
          'Sql',
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
