import 'package:flutter/material.dart';
import 'package:masterskills/Screens/Homescreens/quiz/quiz.dart';
import 'package:masterskills/Screens/Homescreens/quiz/result.dart';

class html extends StatefulWidget {
  const html({Key key}) : super(key: key);

  @override
  State<html> createState() => _htmlState();
}

class _htmlState extends State<html> {
  final _questions = const [
    {
      'questionText':
          'Q1. Which of the following tag is used for inserting the largest heading in HTML?',
      'answers': [
        {'text': 'head', 'score': -2},
        {'text': '<h1>', 'score': -2},
        {'text': '<h6>', 'score': 10},
        {'text': 'heading', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. Who is the father of HTML?',
      'answers': [
        {'text': 'Rasmus Lerdorf', 'score': -2},
        {'text': 'Brendan Eich', 'score': -2},
        {'text': 'Sergey Brin', 'score': -2},
        {'text': 'Form class statement', 'score': 10},
      ],
    },
    {
      'questionText': ' Q3. HTML stands for __________',
      'answers': [
        {'text': 'HyperText Markup Language', 'score': 10},
        {'text': 'HyperText Machine Language', 'score': -2},
        {'text': 'HyperText Marking Language', 'score': -2},
        {'text': 'HighText Marking Language', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. What is the correct syntax of doctype in HTML5?',
      'answers': [
        {'text': '<!doctype html>', 'score': 10},
        {'text': '</doctype html>', 'score': -2},
        {'text': '<doctype html>', 'score': -2},
        {'text': '<doctype html!>', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q5. Which of the following is used to read an HTML page and render it?',
      'answers': [
        {'text': 'Web browser', 'score': 10},
        {'text': 'Web server', 'score': -2},
        {'text': 'Web network', 'score': -2},
        {'text': 'Web matrix', 'score': -2},
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
          'Html',
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
