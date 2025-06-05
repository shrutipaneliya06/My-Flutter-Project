import 'package:flutter/material.dart';

class NeedHelp extends StatefulWidget {
  const NeedHelp({Key key}) : super(key: key);

  @override
  State<NeedHelp> createState() => _NeedHelpState();
}

class _NeedHelpState extends State<NeedHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'FAQs',
          style: TextStyle(fontSize: 30),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset('images/needhelp.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Text(
                  'Master Skills Always Ready To Help You......',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
