import 'package:assignment/name.dart';
import 'package:assignment/tefi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('mmmmmmmm'),
        ),
        body: Center(
          child: Column(
            children: [
              name('mine string as lol'),
              tefi(namecon),
            ],
          ),
        ),
      ),
    );
  }
}
