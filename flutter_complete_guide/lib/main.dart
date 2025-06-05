import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(_MyApp());

class _MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<_MyApp> {
  final _question = const [
    {
      'queText': 'what\'s your color ?',
      'answ': [
        {'text': 'black', 'score': 10},
        {'text': 'white', 'score': 5},
        {'text': 'pruple', 'score': 1},
      ],
    },
    {
      'queText': 'what\'s your animal',
      'answ': [
        {'text': 'cat', 'score': 3},
        {'text': 'dog', 'score': 7},
        {'text': 'lion', 'score': 10},
      ],
    },
    {
      'queText': 'what\'s your food',
      'answ': [
        {'text': 'burger', 'score': 9},
        {'text': 'pizza', 'score': 10},
        {'text': 'hotdog', 'score': 5},
        {'text': 'fries', 'score': 8},
      ],
    },
  ];
  var _qi = 0;
  var _totalScore = 0;

  void _reset() {
    setState(() {
      var _qi = 0;
      var _totalScore = 0;
      print('object');
    });
  }

  void _ansque(int score) {
    _totalScore += score;
    setState(() {
      _qi = _qi + 1;
    });
    print(_qi);
    if (_qi < _question.length) {
      print('we have more..');
    } else {
      print('no more..');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my app'),
        ),
        body: _qi < _question.length
            ? quiz(
                ansque: _ansque,
                question: _question,
                qi: _qi,
              )
            : result(_totalScore, _reset),
      ),
    );
  }
}
