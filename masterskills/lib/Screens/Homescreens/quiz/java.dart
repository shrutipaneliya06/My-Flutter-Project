import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

class java extends StatefulWidget {
  const java({Key key}) : super(key: key);

  @override
  State<java> createState() => _javaState();
}

class _javaState extends State<java> {
  final _questions = const [
    {
      'questionText': 'Q1.  Who invented Java Programming?',
      'answers': [
        {'text': 'Guido van Rossum', 'score': -2},
        {'text': 'Dennis Ritchie', 'score': -2},
        {'text': 'James Gosling', 'score': 10},
        {'text': 'Bjarne Stroustrup', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. Which statement is true about Java?',
      'answers': [
        {
          'text': 'Java is a sequence-dependent programming language',
          'score': -2
        },
        {'text': 'Java is a code dependent programming language', 'score': -2},
        {
          'text': 'Java is a platform-dependent programming language',
          'score': -2
        },
        {
          'text': 'Java is a platform-independent programming language',
          'score': 10
        },
      ],
    },
    {
      'questionText':
          ' Q3.  Which component is used to compile, debug and execute the java programs?',
      'answers': [
        {'text': 'JDK', 'score': 10},
        {'text': 'JRE', 'score': -2},
        {'text': 'JIT', 'score': -2},
        {'text': 'JVM', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4.  Which one of the following is not a Java feature?',
      'answers': [
        {'text': 'Use of pointers', 'score': 10},
        {'text': 'Object-oriented', 'score': -2},
        {'text': 'Portable', 'score': -2},
        {'text': 'Dynamic and Extensible', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q5. Which of these cannot be used for a variable name in Java?',
      'answers': [
        {'text': 'keyword', 'score': 10},
        {'text': 'identifier & keyword', 'score': -2},
        {'text': 'identifier', 'score': -2},
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
          'Java',
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
