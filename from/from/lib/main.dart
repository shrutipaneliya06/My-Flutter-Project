// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:from/home.dart';
import 'package:from/value.dart';

void main(List<String> args) {
  runApp(const from());
}

class from extends StatefulWidget {
  const from({super.key});

  @override
  State<from> createState() => _fromState();
}

class _fromState extends State<from> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
    );
  }
}
