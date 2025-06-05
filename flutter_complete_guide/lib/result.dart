import 'package:flutter/material.dart';

class result extends StatelessWidget {
  final int resultscore;
  final VoidCallback reset;
  result(this.resultscore, this.reset);

  String get resultParse {
    String resultText;
    if (resultscore <= 8) {
      resultText = "you are innocent !";
    } else if (resultscore <= 12) {
      resultText = "you are likeable !";
    } else if (resultscore <= 16) {
      resultText = "you are strange !";
    } else {
      resultText = "you are bad !";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultParse,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          // textbutton
          TextButton(
            child: Text('Reset Quiz'),
            onPressed: reset,
          ),
        ],
      ),
    );
  }
}
