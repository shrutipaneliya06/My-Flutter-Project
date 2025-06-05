import 'package:flutter/material.dart';

class ans extends StatelessWidget {
  final VoidCallback selectHandler;
  final String ansText;
  ans(this.selectHandler, this.ansText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // raisedbutton
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: Text(ansText),
        onPressed: selectHandler,
      ),
    );
  }
}
