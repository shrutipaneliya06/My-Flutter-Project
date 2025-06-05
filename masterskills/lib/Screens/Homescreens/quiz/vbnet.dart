import 'package:flutter/material.dart';
import 'package:masterskills/Screens/Homescreens/quiz/quiz.dart';
import 'package:masterskills/Screens/Homescreens/quiz/result.dart';

class vbnet extends StatefulWidget {
  const vbnet({Key key}) : super(key: key);

  @override
  State<vbnet> createState() => _vbnetState();
}

class _vbnetState extends State<vbnet> {
  final _questions = const [
    {
      'questionText': 'Q1. Who developed Visual Basic?',
      'answers': [
        {'text': 'Symantec', 'score': -2},
        {'text': 'Ashton-Tate', 'score': -2},
        {'text': 'Microsoft', 'score': 10},
        {'text': 'Sybase', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q2.  Which of the following statement is used to define a class in visual basic?',
      'answers': [
        {'text': 'Event class statement', 'score': -2},
        {'text': 'Form class statement', 'score': -2},
        {'text': 'Event statement', 'score': -2},
        {'text': 'Class statement', 'score': 10},
      ],
    },
    {
      'questionText':
          ' Q3. Which of the following extension is used to represent the project file in Visual Basic?',
      'answers': [
        {'text': '.vbp', 'score': 10},
        {'text': '.vb', 'score': -2},
        {'text': '.cls', 'score': -2},
        {'text': '.vvb', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q4. If you keep a variable undeclared, it is automatically taken as to which of the following data type in Visual Basic?',
      'answers': [
        {'text': 'Object', 'score': 10},
        {'text': 'Char', 'score': -2},
        {'text': 'Int', 'score': -2},
        {'text': 'None of the Mentioned', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q5. Which of the following applications can be developed using Visual Basic tool?',
      'answers': [
        {'text': 'Graphical User Interface', 'score': 10},
        {'text': 'Real-time', 'score': -2},
        {'text': 'Character User Interface', 'score': -2},
        {'text': 'All of the mentioned', 'score': -2},
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
          'Vb.Net',
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
