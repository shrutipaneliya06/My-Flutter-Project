import 'package:flutter/material.dart';
import 'package:masterskills/Screens/Homescreens/quiz/quiz.dart';
import 'package:masterskills/Screens/Homescreens/quiz/result.dart';

class python extends StatefulWidget {
  const python({Key key}) : super(key: key);

  @override
  State<python> createState() => _pythonState();
}

class _pythonState extends State<python> {
  final _questions = const [
    {
      'questionText': 'Q1. Who developed Python Programming Language?',
      'answers': [
        {'text': 'Wick van Rossum', 'score': -2},
        {'text': 'Dennis Ritchie', 'score': -2},
        {'text': 'Guido van Rossum', 'score': 10},
        {'text': 'Bjarne Stroustrup', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. Which type of Programming does Python support?',
      'answers': [
        {'text': 'object-oriented programming', 'score': -2},
        {'text': 'structured programming', 'score': -2},
        {'text': 'functional programming', 'score': -2},
        {'text': 'all of the mentioned', 'score': 10},
      ],
    },
    {
      'questionText':
          ' Q3. Is Python case sensitive when dealing with identifiers?',
      'answers': [
        {'text': 'yes', 'score': 10},
        {'text': 'no', 'score': -2},
        {'text': 'machine dependent', 'score': -2},
        {'text': 'none of the mentioned', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q4. Which of the following is the correct extension of the Python file?',
      'answers': [
        {'text': '.py', 'score': 10},
        {'text': '.python', 'score': -2},
        {'text': '.pl', 'score': -2},
        {'text': '.p', 'score': -2},
      ],
    },
    {
      'questionText': 'Q5. All keywords in Python are in _________',
      'answers': [
        {'text': 'None of the mentioned', 'score': 10},
        {'text': 'Capitalized', 'score': -2},
        {'text': 'lower case', 'score': -2},
        {'text': 'UPPER CASE', 'score': -2},
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
          'Python',
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
