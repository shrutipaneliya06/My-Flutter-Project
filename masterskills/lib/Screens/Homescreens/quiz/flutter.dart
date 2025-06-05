import 'package:flutter/material.dart';
import 'package:masterskills/Screens/Homescreens/quiz/quiz.dart';
import 'package:masterskills/Screens/Homescreens/quiz/result.dart';

class flutter extends StatefulWidget {
  const flutter({Key key}) : super(key: key);

  @override
  State<flutter> createState() => _flutterState();
}

class _flutterState extends State<flutter> {
  final _questions = const [
    {
      'questionText':
          'Q1. The first alpha version of Flutter was released in ?',
      'answers': [
        {'text': '2016', 'score': -2},
        {'text': '2018', 'score': -2},
        {'text': '2017', 'score': 10},
        {'text': '2019', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q2. Who developed the Flutter Framework and continues to maintain it today?',
      'answers': [
        {'text': 'Facebook', 'score': -2},
        {'text': 'Microsoft', 'score': -2},
        {'text': 'Oracle', 'score': -2},
        {'text': 'Google', 'score': 10},
      ],
    },
    {
      'questionText':
          ' Q3. Which programming language is used to build Flutter applications?',
      'answers': [
        {'text': 'Dart', 'score': 10},
        {'text': 'Kotlin', 'score': -2},
        {'text': 'Java', 'score': -2},
        {'text': 'Go', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. How many types of widgets are there in Flutter?',
      'answers': [
        {'text': '2', 'score': 10},
        {'text': '4', 'score': -2},
        {'text': '6', 'score': -2},
        {'text': '8+', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q5. A sequence of asynchronous Flutter events is known as a:',
      'answers': [
        {'text': 'Stream', 'score': 10},
        {'text': 'Flow', 'score': -2},
        {'text': 'Series', 'score': -2},
        {'text': 'Current', 'score': -2},
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
          'Flutter',
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
