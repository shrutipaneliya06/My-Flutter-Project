import 'package:flutter/material.dart';

import './text.dart';

class TextControl extends StatelessWidget {
  final VoidCallback hideTextHandler;
  final Color questionColor;
  final DisplayText text;

  TextControl(this.hideTextHandler, this.questionColor, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: EdgeInsets.only(top: 100, left: 25, right: 25),
      child: ElevatedButton(
        child: text,
        onPressed: hideTextHandler,
      ),
    );
  }
}
