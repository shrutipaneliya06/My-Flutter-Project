import 'dart:core';
import 'package:flutter/material.dart';
import 'package:masterskills/Screens/Homescreens/Account.dart';
import 'package:url_launcher/url_launcher.dart';

class read extends StatefulWidget {
  const read({Key key}) : super(key: key);

  @override
  State<read> createState() => _readState();
}

class _readState extends State<read> {
  List img = [
    'images/c logo.png',
    'images/c++ logo.png',
    'images/java logo.png',
    'images/flutter logo.png',
    'images/python logo.png',
    'images/sql logo.png',
    'images/php logo.png',
    'images/vbnet logo.png',
    'images/html logo.png',
    'images/css logo.png',
    'images/javascript logo.png',
    'images/kotlin logo.png',
  ];

  List link = [
    'https://www.javatpoint.com/c-programming-language-tutorial',
    'https://www.javatpoint.com/cpp-tutorial',
    'https://www.javatpoint.com/java-tutorial',
    'https://docs.flutter.dev/reference/tutorials',
    'https://www.javatpoint.com/python-tutorial',
    'https://www.javatpoint.com/sql-tutorial',
    'https://www.javatpoint.com/php-tutorial',
    'https://www.javatpoint.com/vb-net',
    'https://www.javatpoint.com/html-tutorial',
    'https://www.javatpoint.com/css-tutorial',
    'https://www.javatpoint.com/javascript-tutorial',
    'https://www.javatpoint.com/kotlin-tutorial',
  ];

  List name = [
    'C',
    'C++',
    'Java',
    'Flutter',
    'Python',
    'Sql',
    'Php',
    'Vb.Net',
    'Html',
    'Css',
    'JavaScript',
    'Kotlin'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Account(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Read',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: GridView.builder(
            padding: EdgeInsets.all(1),
            itemCount: img.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 3, mainAxisSpacing: 3),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  final url = link[index];
                  await launch(
                    url,
                    forceWebView: true,
                  );
                },
                child: Container(
                  height: 200,
                  child: Column(
                    children: [
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset(
                          img[index],
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        elevation: 5,
                      ),
                      Text(
                        name[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
