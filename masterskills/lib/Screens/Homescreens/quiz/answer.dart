import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // use SizedBox for white space instead of Container
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ElevatedButton(
            onPressed: selectHandler,
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.white, fontSize: 20)),
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            child: Text(
              answerText,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),

      // RaisedButton is deprecated and should not be used
      // Use ElevatedButton instead

      // child: RaisedButton(
      //   color: const Color(0xFF00E676),
      //   textColor: Colors.white,
      //   onPressed: selectHandler(),
      //   child: Text(answerText),
      // ), //RaisedButton
    ); //Container
  }
}
