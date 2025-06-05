import 'package:flutter/material.dart';

import 'textControl.dart';
import './text.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool isHidden = true;
  var questionText = DisplayText('Will you find the one?');

  void _showQuestion() {
    questionText = DisplayText('Nope');

    setState(() {
      isHidden = false;
    });

    print('Set to false');
  }

  void _showAnswer() {
    questionText = DisplayText('Will you find the one?');

    setState(() {
      isHidden = true;
    });

    print('Set to true');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Assignment!'),
        ),
        body: isHidden
            ? TextControl(_showQuestion, Colors.green, questionText)
            : TextControl(_showAnswer, Colors.red, questionText),
      ),
    );
  }
}
