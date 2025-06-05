import 'package:flutter/material.dart';
import 'package:masterskills/Screens/Homescreens/quiz/quiz.dart';
import 'package:masterskills/Screens/Homescreens/quiz/result.dart';

class kotlin extends StatefulWidget {
  const kotlin({Key key}) : super(key: key);

  @override
  State<kotlin> createState() => _kotlinState();
}

class _kotlinState extends State<kotlin> {
  final _questions = const [
    {
      'questionText': 'Q1. Kotlin is developed by?',
      'answers': [
        {'text': 'Google', 'score': -2},
        {'text': 'Microsoft', 'score': -2},
        {'text': 'JetBrains', 'score': 10},
        {'text': 'Adobe ', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q2. Which of following is used to handle null exceptions in Kotlin?',
      'answers': [
        {'text': 'Range', 'score': -2},
        {'text': 'Sealed Class', 'score': -2},
        {'text': 'Lambda function', 'score': -2},
        {'text': 'Elvis Operator', 'score': 10},
      ],
    },
    {
      'questionText': ' Q3. Which file extension is used to save Kotlin files.',
      'answers': [
        {'text': '.kt or .kts', 'score': 10},
        {'text': '.java', 'score': -2},
        {'text': '.kot', 'score': -2},
        {'text': '.andriod', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. All classes in Kotlin classes are by default?',
      'answers': [
        {'text': 'final', 'score': 10},
        {'text': 'public', 'score': -2},
        {'text': 'sealed', 'score': -2},
        {'text': 'abstract', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q5. Which of the followings constructors are available in Kotlin?',
      'answers': [
        {'text': 'Both', 'score': 10},
        {'text': 'Primary constructor', 'score': -2},
        {'text': 'Secondary constructor', 'score': -2},
        {'text': 'None of the above', 'score': -2},
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
          'Kotlin',
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
