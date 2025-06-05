import 'package:flutter/material.dart';
import './ans.dart';
import './que.dart';

class quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int qi;
  final Function(int) ansque;
  quiz({
    @required this.question,
    @required this.ansque,
    @required this.qi,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(question.elementAt(0)),
        que(question[qi]['queText'] as String),
        ...(question[qi]['answ'] as List<Map<String, Object>>).map((answ) {
          return ans(() => ansque(answ['score']), answ['text'] as String);
        }).toList()
      ],
    );
  }
}
