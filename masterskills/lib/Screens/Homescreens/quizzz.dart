import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:masterskills/Screens/Homescreens/quiz/c++.dart';
import 'package:masterskills/Screens/Homescreens/quiz/flutter.dart';
import 'package:masterskills/Screens/Homescreens/quiz/html.dart';
import 'package:masterskills/Screens/Homescreens/quiz/java.dart';
import 'package:masterskills/Screens/Homescreens/quiz/js.dart';
import 'package:masterskills/Screens/Homescreens/quiz/kotlin.dart';
import 'package:masterskills/Screens/Homescreens/quiz/php.dart';
import 'package:masterskills/Screens/Homescreens/quiz/python.dart';
import 'package:masterskills/Screens/Homescreens/quiz/sql.dart';
import 'package:masterskills/Screens/Homescreens/quiz/vbnet.dart';
import 'Account.dart';
import 'quiz/c.dart';

class quizzz extends StatefulWidget {
  const quizzz({Key key}) : super(key: key);

  @override
  State<quizzz> createState() => _quizzzState();
}

class _quizzzState extends State<quizzz> {
  List langu = [
    'C',
    'C++',
    'Java',
    'Flutter',
    'Python',
    'Sql',
    'Php',
    'Vb.Net',
    'Html',
    'Java Script',
    'Kotlin'
  ];
  List age = [
    c(),
    cplus(),
    java(),
    flutter(),
    python(),
    sql(),
    php(),
    vbnet(),
    html(),
    js(),
    kotlin()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Account(),
        ),
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              'Quiz',
              style: TextStyle(fontSize: 30),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/quiz.jpeg'), fit: BoxFit.cover)),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                alignment: Alignment.center,
                color: Colors.black.withOpacity(0.7),
                child: ListView.builder(
                    itemCount: langu.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          langu[index],
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: Colors.white, size: 40),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return age[index];
                          }));
                        },
                      );
                    }),
              ),
            ),
          ),
        ));
  }
}
